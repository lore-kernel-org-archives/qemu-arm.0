Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2452888njk;
        Mon, 27 Jan 2025 05:59:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWEjpGecpd1Vjp7rfmzWUOEQleD7rufl8GLNBg7UWjcEQN88XlP+lN47pjtl7A4SME1Ogyvm6KFkwAasg==@linaro.org
X-Google-Smtp-Source: AGHT+IFbLe7rnONLrxmv13yxneRRy1Z5Tr6XRjZCYw/IkYsgSdNK8mQIBthxE97mBZ0ZPARnqFY/
X-Received: by 2002:a05:622a:144e:b0:467:6e45:218d with SMTP id d75a77b69052e-46e12a25235mr663116151cf.3.1737986343608;
        Mon, 27 Jan 2025 05:59:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986343; cv=none;
        d=google.com; s=arc-20240605;
        b=hwuUtAeOUSzwWkDMhaBabEuDAL5ftW/h7CI+/Q44BGmM1zPJgO9nUzvM6tRJWE6IVY
         nOdQOSTM2CBqF89r9dDkFxP+8i/yO7hg8x63Qo8DTd0i2oRl/QlUSwjmbtOQaOwLjXjD
         zAcpOWjISN8W7e+5pacs39csKSSGxJ8WuYgPFB/a6N4PCqVCdecKWvfFfuObrslkLv7O
         tc+4498aYHC9QTXHlXjI7/Rt027IwMKwgDBFa8Dc7A0E0fb1eSiq7SuaiWeAxxatmzg9
         gF4QAgBqcy3tkiy4AHnyevWWZm8Jul68BlfNmbOQYk7cPfY5GL2BHHLxIiW6Wf1kwAmR
         Ck/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=l9lQ5q8fUXU7mUn7AT8j8tkDuQOfM8Aqlg3APIDrH7A=;
        fh=rOnkePo1cBxysbC66fOtZxnqWiZLjlbt+9S0ROmSCwo=;
        b=L9pzEmn3kctB2/fxWNqVSlVwlCofVoimcBArocYGC9QkaJfpLoKOJZoDDZGhB90ayv
         /EEVFCVBMLowASmbCP3zTGa910b4Yb06Vj8ltuMb2VA0PZhDIOaaVN5pMK2TmQI4wlLT
         P+kdVD204xnGaJ8gzomiHR3Z+ha0llnLDL6vJ0eMvztCfcczA/UDtSMmT0vMEz0SD2hv
         YdzCARTJt4FF1Cp+q6oU0imE61yzD07MATBRjktHm5nHn0/5sLE+iDZfVx1nGMhKFuPT
         cvl33POWcNicVEcTIApqirxaBFvgWdiiB/aFGgRKIxwL6HZe6/gUc1XzV7KVAOrQ6qb7
         uVrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a4F4FQIF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b881dfsi105221391cf.425.2025.01.27.05.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:59:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a4F4FQIF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPdc-0003nZ-3Z; Mon, 27 Jan 2025 08:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPdb-0003n2-3t
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:58:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPdX-0007qV-3O
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:58:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737986324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=l9lQ5q8fUXU7mUn7AT8j8tkDuQOfM8Aqlg3APIDrH7A=;
 b=a4F4FQIFI7EBYgXVqkqv0t5EDaaPXjcfiWA118YBibop4yrd5whhTAIJgmLImNvNxuPcxi
 pBN6O9j3Ttw3yRkTtN93f5qY9Zeo6168IsDt9vTI5zjIPU7EpHPOgtdgZZj11lsT3xmu4l
 2ejLJpRyOTtGvigiAKD1Xj5nXn5U2lQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-eJ-Y8hYCMzu3dlykr0YJ-g-1; Mon, 27 Jan 2025 08:58:43 -0500
X-MC-Unique: eJ-Y8hYCMzu3dlykr0YJ-g-1
X-Mimecast-MFC-AGG-ID: eJ-Y8hYCMzu3dlykr0YJ-g
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ab698a658ceso115667666b.3
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:58:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986322; x=1738591122;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l9lQ5q8fUXU7mUn7AT8j8tkDuQOfM8Aqlg3APIDrH7A=;
 b=YBA3617unM4dGeZkh1QgDQqx1+i1dCN43QD5A2mFOKhjeOj1OcS6gRiqT3W4pXP4xv
 plaptigq4M2TD+X7+RItcJgr+fNyp2qV91FKO5WRoUgsOSwUmPCwp+vyy7YTDAObVtvM
 wdaI0YpXbFuBdUiXs4ARqBaKO0DypfimzYS0LkcyWFMb2gifQ2WIwJtmnma3dfbkOo2m
 5PKRBApECzt9vDPflc/uLMdhUyYA+aKc0pyUazgYh2utuNj341a1oUQYvF4aK3RE6K7u
 0P92tsOQE66uUGbAzKNYtRZN8Ilnx/z9rUYVVkp/SnyUbQKBpI7krdg+Im4WhkePROKI
 k1eg==
X-Gm-Message-State: AOJu0Yz5CL1nvvHygnKyOxy3aRgjHzSNWm8m90UCvUMWf8TYnyBgRaZU
 jEvx2+GTvQfAZVJUFkbP8hTmxf6Fjpxc0rdBxPfzQkLALuz1NDF6UFOxS4RK06+7PHjrvTropVO
 pYhaD9DjIA+GDnevjK9NY9z1NVPZtwaPwFVZWDKmQDEB0sdjRpw==
X-Gm-Gg: ASbGncvA3JcxZBVxGt4w5sjk0WVW1wxcCeYYBtFFE9p4cjtytgf0NQnIexn4ebd1hy/
 DAAZgDESVLeS6wGUTuFozcffKXLpfdyq0CRkg4XZZyi+Ne51ioxLB/qxd1/xuVbQKEHR8F2OdxI
 iAsonNxnHklcwPj6XDGOCZGmu/uwwJehNBdLVspI8Ne5SqwgHwWgeUd4WvF3piTKCOvX6/qP2Oo
 G7K2X7ApegaUAK8BIf11e8rManiMmSNcW+szEjTy0z64rwU3tXYSxKNSzZ6ccJHset1md1Y3fQl
 9fa0S/PCJYpuhp867HqkWtWRmdJ28A==
X-Received: by 2002:a17:907:3602:b0:aaf:74b3:80db with SMTP id
 a640c23a62f3a-ab38b0b90f1mr3920122866b.3.1737986321868; 
 Mon, 27 Jan 2025 05:58:41 -0800 (PST)
X-Received: by 2002:a17:907:3602:b0:aaf:74b3:80db with SMTP id
 a640c23a62f3a-ab38b0b90f1mr3920119366b.3.1737986321519; 
 Mon, 27 Jan 2025 05:58:41 -0800 (PST)
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab0bcsm592753066b.95.2025.01.27.05.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 05:58:41 -0800 (PST)
Message-ID: <ea276c37-9986-4539-915b-e1ba40682bc1@redhat.com>
Date: Mon, 27 Jan 2025 14:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] target/mips: Set disassemble_info::endian value in
 disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-6-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250127115426.51355-6-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Q91wMdyxGlReNWYLiTtrwnXAjTHAWiVLzVqV_vAJCL0_1737986322
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YTYG+mr5u0Op

On 27/01/2025 12.54, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/mips/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>

