Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1857107ejc;
        Fri, 24 Feb 2023 07:06:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+KshBTLmtwiMU6u+s2xBK/PzKhxHJyhapfCproPMoAfY7UbpQqcs2uIzLI1imkVO2xvwRU
X-Received: by 2002:a67:8c81:0:b0:415:521:b0e with SMTP id o123-20020a678c81000000b0041505210b0emr11212887vsd.12.1677251203678;
        Fri, 24 Feb 2023 07:06:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677251203; cv=none;
        d=google.com; s=arc-20160816;
        b=NzQ8oslKt/Q24g5UFKj/7cAC/5326FJsbCvN/mg0JGjpQbuircxTZ3Fo+8THL38TrN
         AoeT0IQ/uZXjZYmKOC5g6J/gXiKJ/KxUcgdlOu+/vHV1ZU7U6UrM/ALIZA7WSokN6Gj9
         udYF0SeOT1WndtF9FGhm07aDwz1aU9F+whae+lEsvwjShHwdwKmE+TWHxr5xtXZRY8uE
         q/TfI1oi44Cf9LzBr29NkKv4ovpq+ZfXc2pd9EtT+8HHMSr+Uwsh3iWZdWiZLox/pmJn
         4Inqkt/iIqyYYLEKM6+3fJI/GU0WA+O6XUekRZMZDyszlsCSqGMSrg8iHB99wjxiMLrR
         WBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9OsrfWDNdPmpoy5UQ0TQrTyvzLpjmADL/vWf1DVPsZ0=;
        b=idnC+VCEn1jySqlsvaa1vhrmdpGGjrM/FS4GZb2mlsbBAjYj22QwBvQ5D4C/Q8QPdT
         fJj+/26JuIo85IPuaI8ITLr8POXvk1zG2PSXhinRgX5/pxGi+gz9Zcx96AglJlh+A7/t
         oF4QK6g/9okdu6h2AwFeX2esEoTTNMxXGZq3AoPy61wQZUz1CzFVkHYAGLLW+4zenPOQ
         Cn4tlLEvJV+k6P0c8hF7SprgL2b6xN4/bfqkvyD6tIxOFRoT/SXeBueyCGcJKwz/WzNT
         eAmHLeXQ4g3vptZmHorucqercTMROb2/0QNrqHJkDFft0plL0wKxSI9Q95QEp/O+qxsa
         GVYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xeynr9D5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15-20020a67f34f000000b00417095dd64dsi9134590vsm.331.2023.02.24.07.06.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 07:06:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xeynr9D5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVZee-00050P-SO; Fri, 24 Feb 2023 10:06:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZeb-0004wv-56
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 10:06:33 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZeY-0005qn-K2
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 10:06:32 -0500
Received: by mail-pl1-x62e.google.com with SMTP id u14so13101302ple.7
 for <qemu-arm@nongnu.org>; Fri, 24 Feb 2023 07:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9OsrfWDNdPmpoy5UQ0TQrTyvzLpjmADL/vWf1DVPsZ0=;
 b=Xeynr9D53EjlFuU8Fbsjp+HCtE93nIGLp96BSeE/Ubbxe5P8MeJrTOkV1snRTTXIXX
 3iFHa8iLw25c7dizxCLq5bkWYx+XCfg3PixDdfpZkItUe+OFZ0KsjgN7OWxQzGBttjew
 e5+73Fp6p9uX3a0Kj3kJYs1EJFxL1EkWvbBR2X85I/WTFz3FNO4ub2cSR9Nt04yX/lOy
 YVl74lVvvqPmz/qWtxkqb3kI54/DXGXv/+fWGICYvA9h51NGCpfWeg18M/jcweIa0dZ7
 Ox7arfV8k1XZzLNqw+q7JRySRFW1VQf4clbeM7kOL/eRSXhnAG8fGQQkC21oet3ZM2xF
 yJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9OsrfWDNdPmpoy5UQ0TQrTyvzLpjmADL/vWf1DVPsZ0=;
 b=UOlD8A7sftm5LbvjI5zl0DL5KbV5ehAoB0EbQjk7xRHDIq4JIGI08NoxYeANZ3wQzJ
 pnYkG5fe4sGvy8qMoyqC8/n9/U5tyqTc1H0oB6F8EdAGfFCmfnAeBP1qxsAuEISlYF+0
 wfuZGHPt8d+4JqFeMO788VMVyvYvy0Ab6z/8lIeFOI8PDmPHtOk8ri0SDiYx9rZULbKF
 rDSAg1bGp3DDf8cVrpsIpu5JHmzuqFM9uNomWVbcfi0cV3DmIfuknDxs8JJ8qfb9LCev
 tQMXc+mSPCYxUoPjiYfifgODpAOuT5ANBPwHtzGsqRIB/NyMycNSneFOEVKQkDkbIVYJ
 G1hw==
X-Gm-Message-State: AO0yUKV5N7o5Oso8WBK9Yb6qIQdhuSFNWES/nAyEdgIzsEd/se26Hvcx
 fGE0G2gcW1HedZsgMHBOiNN8kVPh9viaezZkz2NPNw==
X-Received: by 2002:a17:903:3307:b0:199:4a4f:9d2a with SMTP id
 jk7-20020a170903330700b001994a4f9d2amr3208292plb.13.1677251188494; Fri, 24
 Feb 2023 07:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-21-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 15:06:17 +0000
Message-ID: <CAFEAcA81+8purhnHceWr5oCXBX9Km0eC31+VKnXW=9wKU6eioQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/25] target/arm: Use get_phys_addr_with_struct for
 stage2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 9ZOlwxyF5GIs

On Wed, 22 Feb 2023 at 02:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fixes a bug in which we failed to initialize
> the result attributes properly after the memset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
