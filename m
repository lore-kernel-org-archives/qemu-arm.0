Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp7570ejb;
        Wed, 25 Oct 2023 16:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXXrqfaLYIeN9I0dnCtJLJxbo84wgjmNOFg6a6FlJKFWz8e6gepFSnD9FprvWeWz/YP8Fm
X-Received: by 2002:a05:620a:3ac2:b0:776:5135:d96d with SMTP id ss2-20020a05620a3ac200b007765135d96dmr13781777qkn.69.1698277031441;
        Wed, 25 Oct 2023 16:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698277031; cv=none;
        d=google.com; s=arc-20160816;
        b=Df+ArgseIsBSncc03k4vvvHfOjHnoqIvbxGyfqVvvAwbtDDdu2nIgAGoz6NxuONcGx
         ChfIgzSBhBpIJdlM/QYAY42Da77oP7fHtJwSzIKZcI9nPEYJEr6LZq0kPB4C2ULzkMoc
         nhl3sHI1esDH/D2Ca1lXQNnvGUdylT5vVB89A6jDUegJ1OBsu/d6In3cwxbKL72+jAD4
         kuteU0nidFRPauZkOY/d2nVmszEZ2hQoBFYKHClV7EhVELUqo3fBwORqN9mWJBy6l6Uv
         zz8i7uTSVFa0nHaBOigeCvObhrcXkMUNBEw6IUxVnNKO7h/YHOsW/uXlqNuyPlDgg5J2
         ytTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=lbDplwFwBtbsgEx53dxsIKsnRXUUDM9zZs4TUkjSkLo=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=tYuAIuo5bZHhTgh5w8iD0o99kQb4rcInxH9flyBZhrYl4i/a0oZAefyLF+4rbFBh8Z
         eymEHV0m6bh+3Mx3CEUk3+SRoXXa64iZqKN0lH9iZBNR6ngW7jYy5Nf86OYDbHx6iukV
         Qm5N21cNMAOBILMH8/2o/PGjMdXZLmWSVl5hHvY4w75uimQCMn05AbOQ2SHgmMA0l1Pl
         IDOLY5KyC/5Z8ryV1Iybcq3VxeMqxROQSc/VLJxsRPPZTnO6QfEe3tOeio1nwC0GYdC7
         KnrYunZwZwsfM+T8zmUdYvMA+aJTstYQ6P+Prh5+wEmNGTKo9oCJH30FKEZeVlHwMfC/
         gzKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sp2novtS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d24-20020a05620a141800b00778910ef6c8si8382165qkj.602.2023.10.25.16.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 16:37:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Sp2novtS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvnQl-0004z3-8L; Wed, 25 Oct 2023 19:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnQi-0004wM-Ov
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 19:36:52 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnQh-0007ZJ-6d
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 19:36:52 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-27d4372322aso206831a91.3
 for <qemu-devel@nongnu.org>; Wed, 25 Oct 2023 16:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698277010; x=1698881810; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lbDplwFwBtbsgEx53dxsIKsnRXUUDM9zZs4TUkjSkLo=;
 b=Sp2novtSDZsh0ZqvtJ4zHt2JhrO8Tc3Wu/oh6PpdIgHGZ0J+zUYU29UqqNW7tB6cwf
 8iUIf2y5KgpfVu4DwTFIZUl5xuVBjaoZK4uYYin0c1QJyAdv2Z/08PCnWjheHdTIQubE
 +24QUypRQ4w6sX0MeiG4+MVOJSWTKqipiubIiqfAHgMahDHAk8jXEvP7KGdhvMV3NbgB
 SdToPuR5Bh+sLGaJb9xgANBDoaY/KxNaI/Hi6vGyoZ9PeqCB6XZ322/XrLVTQpi/wnlf
 yWzyZxekhWp9ukdq3QGBIfIB/ppk6AhPsJm16aN1mHJx4ALRC/n1orQYPKu5kqSW09ei
 d34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698277010; x=1698881810;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lbDplwFwBtbsgEx53dxsIKsnRXUUDM9zZs4TUkjSkLo=;
 b=MngYcl3h4g63exSie612DTpkaCOm7I4jtmcCukA4aeyaw4SJ/6gQAuOBj3AKcgmxn5
 DuuVMuPJCaoPOuAgw+d7AvVg1j5N2vwd1opwucL9HLDeFDQkboYGJDNRAR30X+IlVYby
 QwNKdFXeSwthrcGQp8HjN9jZWtmuxbNBw1PBs9AFS3jGUY9fQ/ZD152EmL9xFYTfcfzz
 Zo6NvKQnOyD4JHSpcokovYCARlxgtT3YVyg0xzPVZNCxa6L71myo4D/UDm0TSYO5B8wX
 UhK552ZEy3jRAs7GXqCNYDEhCQ8B62dw7kS02ay+X1ySSKCbS6u08haeFPSzGeBhgkKY
 G8mA==
X-Gm-Message-State: AOJu0Yw+E7aLck4dN0uA2swo1SdrWOheOwvrmy/mpHqAQsXYR1CBQITb
 In2LY/9Gz/+P94vPkkBLulKOfw==
X-Received: by 2002:a17:90a:744a:b0:273:f584:40ca with SMTP id
 o10-20020a17090a744a00b00273f58440camr13611444pjk.16.1698277009850; 
 Wed, 25 Oct 2023 16:36:49 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a6b8500b00277371fd346sm475304pjj.30.2023.10.25.16.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 16:36:49 -0700 (PDT)
Message-ID: <8bb99f40-8b09-4414-b2c1-8a92d82ab711@linaro.org>
Date: Wed, 25 Oct 2023 16:36:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] target/arm: Move ID_AA64DFR* feature tests together
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231024163510.2972081-1-peter.maydell@linaro.org>
 <20231024163510.2972081-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231024163510.2972081-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8cxqJ+euqH/G

On 10/24/23 09:35, Peter Maydell wrote:
> Move all the ID_AA64DFR* feature test functions together.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
