Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2214260njb;
        Sun, 11 May 2025 06:58:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWBdPmjyaDhvHVD7yw8HJJSEHEC6gYwbcCQdbpkg6VWmm+sm5a1+ddlWVojm4ueJDhb3NjLVYxqxzVAxQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE4tx38MUPW4xQAR1iQ7twIqX6xft2vMnrDZjmbtEL59/bUrqqChwUikrDo/WNDPDhAFpbJ
X-Received: by 2002:a05:6214:528f:b0:6f2:bcbf:1030 with SMTP id 6a1803df08f44-6f6e48151e4mr144009046d6.43.1746971922315;
        Sun, 11 May 2025 06:58:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746971922; cv=none;
        d=google.com; s=arc-20240605;
        b=VaJwPjs3Y7lj/yIsWQrUNFEJg1Ik1CD3DK2G40iv13LCe84jG4BX70WiiwZg7D7Oh2
         lReo6qAn2OQwvBJT+q0C8P/vR6658eMTAIeT8ZeQJc7G34+cnaarScK93RNRuFLqAy/Y
         Zh8ClbNmBPQwk1OU2tEJzksjr2+wvSFJrtIokEKzBhCbZ0nRs+LC4HS4EMgsCzIzdUEd
         Kw/snPTKIohi+6dzQDro5lstDMIf+rF6s5gs3UlgMqcRiEIuItn+F868EkXSSPkNJth3
         c9P0LNjK+qujOJwfBupxeSFvKMyBRYQQKoIKSQITTxyz2Euu7wVy6zNCOjBc20DBUItb
         F3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DymOizHJz6ZfCWnGwL888QZa3scm7WEzJt+b/qAC9+w=;
        fh=KTkqVRxXRb3PaCCE4K5GKow5mi0o/O6+scCtqTvY5Zs=;
        b=NiNKUunpGM+Uz5MnnC2XHukcT9vJg/EfBv/7KgqjamNsy7x/3BcPdNsH/dW5pg+NpO
         jR5kAO3PnrIadWdaFKPkQnTxRe55BYHy1K6HzbdK9Zuu30TyICU3oFRYYB08a1Z+CfM7
         hW8t+L2tzxEXK4plu8jmX+/PE9xvQN7JgvVoEJbG45rQDbbBA31nImCq0FSrAFMWFJSC
         uG+f6Ob9EmmdYCXkUZYk1YZOcV+oQvtsb9AjbmojqCmMIG47GUjtHbONiV42XxOB4ZLn
         IcLy1J29kMVy8ApvmlmYEyNijDZ18fsstrB5rJE6jwtAkrsYp9wGbl/KPdTA4UD2qS6e
         sVBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NueyoE2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f7f64si66884076d6.155.2025.05.11.06.58.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 May 2025 06:58:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NueyoE2J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uE7C5-0000ya-9o; Sun, 11 May 2025 09:58:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uE7C2-0000xq-Of
 for qemu-arm@nongnu.org; Sun, 11 May 2025 09:58:15 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uE7C1-0003uT-5A
 for qemu-arm@nongnu.org; Sun, 11 May 2025 09:58:14 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e78fc91f30dso2543830276.3
 for <qemu-arm@nongnu.org>; Sun, 11 May 2025 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746971891; x=1747576691; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DymOizHJz6ZfCWnGwL888QZa3scm7WEzJt+b/qAC9+w=;
 b=NueyoE2JRXUVeF7I3XB564JM1jQazs8SZp80emFtM4zOiephqclhrKDPtQDQA2tZUr
 3KuMhB37k9k3t4mTpZ3uOnsZl2m0iUaU2xD/+VcFz5/26xcZeeKLoybbqjftvxl3c0mW
 WWvjtm0OOMR8OLJSUtMsbOtQUcTpSK18v+im4rMkw2YOf7u511LuZ0gT9XtgNTJbVfQC
 GmUBxdi29CfOIcHe0kt0EnHwCkw9uwkKMR5mfiMZqs6xMSHkvtb9imTJ6sQI3z8b1hcp
 3Si9v0rXG3vFnAsYZ8h86dVjyBnHrX3CE+sMVOZep4OSgNJ9kIOqjM2FjIv/N2HI4jT5
 4L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746971891; x=1747576691;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DymOizHJz6ZfCWnGwL888QZa3scm7WEzJt+b/qAC9+w=;
 b=mHbgXRGqQbLSpbvLmhgwG9I8Ocn75MyHpIOkFeGIat6G4BYo/8gIl9xvnbQHkDAqxf
 TKPGynvWV/YgBW9AkYxqe1JEE00LvE83UIdHbG8zrsXc/GwRouNRf6uoXrqwrMJMi2xi
 UkxXjxvV95JxLrOsjBvISIPukdWd3WGWrL10+bajYQdhpFG0i4OWVwqQDocN39lO20LH
 9GLtN3/NIgT7NPmvTmnJW4Yvs7Xji48lOkWv5UaB+1kG+zVw8yNmrQJTtHHgPQTnAE4O
 9YoFUOq0BIAtfEIEV8XOjsEBhJjLOAqEpBvYpL/RCaZ1+LG2wh1h4PrtYQ5t2wIKZXzy
 HkoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/FZDxmirNGlxHos6UH1c8Sp3s+T6QtrjeF7smg93RoBH0qb1vhl8r/fRq3TEIbr/aARuuPNfD9w==@nongnu.org
X-Gm-Message-State: AOJu0YzAB8npABBP76U7GQ9V1sV12ATrQa3e6QTxkeH+ECAxc4DRT6KW
 +gObGFVDDImRkOBIw+b3Umrjm4Bo/ZdO5wLTNH0jgQVe5aSZBto3cgnxz42871u8RtkqqLfF+rv
 P73ZbzgoitDR9XJe/y4K3vt2A5KGS+gOszkNyPg==
X-Gm-Gg: ASbGnctEVDfhC6EnGt151GNlUws//tCDkUshWOTKwCGcdJaQsiVyHV2l+L2AQWKP9nD
 geQCebcvLFW/NVSSvPgKFsdMfZ5uN/Ny8EPdp/vGdv6ji1BZZSajG5jfr7guodtONJii01arCXN
 Z3HBNzz/7j2rsA+kKLBDPSCfGK0ZriRWIMug==
X-Received: by 2002:a05:6902:2503:b0:e78:f1e2:8f25 with SMTP id
 3f1490d57ef6-e78fd9bcf66mr13752766276.0.1746971891287; Sun, 11 May 2025
 06:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250507091859.2507455-1-timlee660101@gmail.com>
 <CAFEAcA82=0Pp9U=W5EAjcVkR0GL_o1iVPuUPA=w2SFy4mwd_5w@mail.gmail.com>
In-Reply-To: <CAFEAcA82=0Pp9U=W5EAjcVkR0GL_o1iVPuUPA=w2SFy4mwd_5w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 May 2025 14:58:00 +0100
X-Gm-Features: AX0GCFvImpE51QOD9twAeL6evaG7etqOtzehgfZin8mrFtvCsefGZHHF6I2eECQ
Message-ID: <CAFEAcA8qYRa+CHD+z687ATYwOBenrm_c1hg=yvVq-hzRDxMdRA@mail.gmail.com>
Subject: Re: [v2] tests/qtest: Add qtest for NPCM8XX PSPI module
To: Tim Lee <timlee660101@gmail.com>
Cc: farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 wuhaotsh@google.com, kfting@nuvoton.com, chli30@nuvoton.com, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: WUXIZcHDEqSL

On Sun, 11 May 2025 at 14:47, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 7 May 2025 at 10:19, Tim Lee <timlee660101@gmail.com> wrote:
> >
> > - Created qtest to check initialization of registers in PSPI Module
> > - Implemented test into Build File
> >
> > Tested:
> > ./build/tests/qtest/npcm8xx-pspi_test
> >
> > Signed-off-by: Tim Lee <timlee660101@gmail.com>
> > ---
> > Changes since v1:
> > - MAINTAINERS file not need to change
> > - Add comment for copyright/license information
> > - Correct CTL registers to use 16 bits
> > - Remove printf() in test cases
>
>
>
> Applied to target-arm.next, thanks.

...but it fails "make check", so I've dropped it:

not ok /aarch64/npcm8xx_pspi/data - ERROR:../../tests/qtest/npcm8xx_pspi-test.c:
80:test_data: assertion failed (output == test): (0x00000000 == 0x00001234)
Bail out!
----------------------------------- stderr -----------------------------------
**
ERROR:../../tests/qtest/npcm8xx_pspi-test.c:80:test_data: assertion failed (outp
ut == test): (0x00000000 == 0x00001234)

(test program exited with status code -6)

thanks
-- PMM
