Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1614875ejx;
        Mon, 11 Sep 2023 14:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESFLRgKtSAaX0F9XIWWa3nWGTBBstp0A/Z6HCbNzKbCnyWCr5beXIJQ26jlRL+XQNHxum+
X-Received: by 2002:a05:620a:471e:b0:76d:b2f2:cb7f with SMTP id bs30-20020a05620a471e00b0076db2f2cb7fmr14130797qkb.12.1694467050858;
        Mon, 11 Sep 2023 14:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694467050; cv=none;
        d=google.com; s=arc-20160816;
        b=oeuTJRwCst7fZGvwQrwmZxT4UhFhqomINQY40UTe7mQ95iWsXWxpqNyCNfAHoVLpWA
         eoRksdzZyz4ahsMarJ4DC0I8r0PBiZSk08zd7cRUpQIPtuZZz74VSlaIIhInUh5z5UqN
         PCCx+E21GSf0kUcuSemkxVfS7NSHnarJA8K3ehQHeZg1Cpg+zua4fHpW+BswKOrQIs/w
         P0lGmKmJhp6LACTp/Quyoxdf9qwjUvDkSBwwOFLHgg6MzSXUnLqOWEHx2VP0mSoVFBMo
         DBXjfCsu4TJ5BFb7PLPXrkRN5i7sDOp2kOSeoG8HgGNIWxor0D4U42Y/x4UCrDvvxyEs
         X6PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=t/6jRAUfYPCl01MpsZyW/MJchcnupdESzndqBpVBt04=;
        fh=PpZ1CCXoZMh/DRvZh+FxXhmYvb7cgaexUeWdx5nsuRU=;
        b=TJzyFHEBTb2bTnW3slFEMpFOKY4GWZ9k/9q+FJOqC0SHb9yZF8J5DCWtKX1zIyBmOY
         tBqhj4N15vWNhS4h4M6oJHOGdw/Vkl/dE4i6OmjP2V8twGue0eiCrredxYFhNt1bhpKa
         Fy1T4GgKUUJd0MPVgJBJNeEYZynwXl3sA4qKHfoggEzMbSfSNp7QsBLCCb67al74ZQb6
         JeGKenPI7goAKPZgEbtlbk52UpiirRhU2BQQ5Z2J2Ec5nLMa2VuGDRvJOqNtXtfh2FgZ
         z2SJjUHLk9dBXdWwwba+dt8QeTgxA2awu8TAP/X8Jskfm1NQ2oN7RQ6dLZUxuUoT9ti6
         hseA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I4Lgpq07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de12-20020a05620a370c00b0076da7802c1csi1081533qkb.59.2023.09.11.14.17.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 14:17:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I4Lgpq07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfoHQ-0006VK-Ei; Mon, 11 Sep 2023 17:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qfoHO-0006Uq-49
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 17:17:10 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qfoHK-0005qi-Dy
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 17:17:09 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68bed2c786eso4033067b3a.0
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 14:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694467024; x=1695071824; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t/6jRAUfYPCl01MpsZyW/MJchcnupdESzndqBpVBt04=;
 b=I4Lgpq07p7LlsbPepoKBkFm1bQynTwilYw6WQohNvfYwHv07BazeAmA9ZI6G4LLgqd
 sYUn+l37SnBfc3Ly3LGuU1IjBTPlIzlcmDxdFUrF9MJIER4qbyb5qFxq0LeJ4Ohk9AQZ
 IhZCuXDjFFT8bUD0VTktaqCB0G53dvABBGV6/CPmcV9zhXwfjBTh6isHWE3Y2edNj4Bt
 5+4Vf8tIlRDzqPFOz0PV67YchPAppWikH+VZFIz2sDOHpTYV7OeCXpirgcDF4CtBISCM
 7WgTt2sDTc714z4bPVtM84U21PnStaC+0pKasYMlkfSztNm98AVz6OhnAMueS5zwk4nG
 jARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694467024; x=1695071824;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t/6jRAUfYPCl01MpsZyW/MJchcnupdESzndqBpVBt04=;
 b=awCNEf3IRhz57dInRoVdINjUdIhXXdtoPj2WWMUgL24WfCz/ljHcYBgcPUU2uJs8iT
 jJ8vlid9Lbfn4APpTCLzl7LbBjTMaECChhDNkfWzpjQ6BswxNwUgAV74LvfXHYyH3r5N
 ui+8IqtoLeLgpyw4WkKNe2TvpqUJVijbVL4jDss0OiUfoD2Jfp9ReSMXRL1Nv1xEmrYA
 tOfQvY13JjDymUwRKcqapxM/AEQrEiOEe3icN17nyGOD8sjv8akFUEQXNrgWLu/qMrKn
 GmdF9K7oDZa+eQqUmFxC7Mjusk/fxyth2j99kmPWXvgPmWsFoXYXT2tZUbCnISgVNV8I
 1bbQ==
X-Gm-Message-State: AOJu0Yzi+IOYqaFnQobMe3g7clN85LeIFwAi8Drz2X04I3rRr6Z5n5AY
 /NOYUYcSDq8U66Q7DNokRUrP8A==
X-Received: by 2002:a05:6a00:13a6:b0:68e:2822:fb36 with SMTP id
 t38-20020a056a0013a600b0068e2822fb36mr11262585pfg.8.1694467024042; 
 Mon, 11 Sep 2023 14:17:04 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 fm22-20020a056a002f9600b00679a4b56e41sm1967662pfb.43.2023.09.11.14.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 14:17:03 -0700 (PDT)
Message-ID: <e925d8cd-d82a-2478-236c-89deaa95c423@linaro.org>
Date: Mon, 11 Sep 2023 14:17:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 11/14] target/arm: Implement the SETG* instructions
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-12-peter.maydell@linaro.org>
 <fbc33e98-2f8e-d503-c219-20c2b6eb02d2@linaro.org>
 <CAFEAcA8V_8wFpLJd7mNygEeU2iCdmMEZz4cXANXfwzD=FBGqkw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8V_8wFpLJd7mNygEeU2iCdmMEZz4cXANXfwzD=FBGqkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9pPwlMnfMReT

On 9/11/23 07:17, Peter Maydell wrote:
>> I think it would be a little better if set_tags was visible to the compiler, via inlining,
>> so that all of the conditions can be folded away.
> 
> Do you mean having a separate triplet of helper functions
> for setg, which then call an inline function shared with
> the normal setp/setm/sete to do the actual work, rather than
> passing "is this setg" via the syndrome ?

Yes.


r~

