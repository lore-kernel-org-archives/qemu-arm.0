Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp434357dyc;
        Thu, 3 Jul 2025 03:23:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUBSbScQEOPyBIup3laBLZexA5TUrNiE3njOXQm0lMc66hRUgxFg0xTvjFis3PBPSVMerfSix55M5eUA==@linaro.org
X-Google-Smtp-Source: AGHT+IHoEerXSqjooWbFtgeO3gB+V7CpbLyBzaJbGwZy0tn5VNTZg+v87AJfB++9gHHaBue30fAy
X-Received: by 2002:a05:6214:262f:b0:6fa:fc96:d10a with SMTP id 6a1803df08f44-702b1b89af1mr106260436d6.27.1751538186283;
        Thu, 03 Jul 2025 03:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538186; cv=none;
        d=google.com; s=arc-20240605;
        b=FPzhdLdA2oIBMHLA8z20ocjufwpganTCrKr2jZKUL0Qq+B1z4yoRSFQNkWKfehnLu7
         mqdqasGyTSCjBu3dPw7wFPwdKXEATMjog6AI+SJLpmJ7FCcW9Mr9HAkMiplNClmyI82U
         Hgl0nYRZ+DLUjGp/YGTuU0jgNN2hvI9uxcsWjBvsQ5scg04Jcr52jcmNWBpk+HeIL2U4
         sguTEGpqi5v89cu4noH9eDOgJvBl0wf0DdYbPakrczzBNYipqt3kJ/FT/11sP367EY2d
         RCa8T+zsg4PQaMMmrhptFtDFHXkn3sVua5PVujxtq1TR7xTKHEGYvClqv+qLWHtisc/U
         Qq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=I9HfEXraln6KjtYBXwnUUI297bke5zf62srW9A4hCMY=;
        fh=0d373ZysFe6OcMk8dquRlAsluFxNgzx6CbpxAyICKeI=;
        b=E+QYbZVLv09iPDCWR5qD/KwFUefNQxk1fkpeqlce9VQzPd00qOzAuK+ippSzqP55CN
         aveIhUVsxmjtLa8A1tj/XAe1Bku07xgRIlOBEGcgJwgKETwvOs65+vBxXTFRQx3ZIkCm
         QgJ40OkiM3K6DcLztsavjtBQ+IknR99IwzfoJ0szXPzSCDq4WQHxEwQ5K+A1JkS1NK8K
         ziA39nnfs11XGy+7D1qnFaV/MYkNyQxdcrH/OB5hOstCeLUv/yt5EJ3qe8uWuDS3IH61
         FSFfY8Q48Aho5dOKv91nRBP4de6oFyzTrHdCNAZQaU2rsa1G07arKLtwnS5qZ59kY6p/
         +KWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J20jD93Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773ae3ffsi171778636d6.496.2025.07.03.03.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J20jD93Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXH5a-0000Ph-1V; Thu, 03 Jul 2025 06:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH5X-0000P7-4n
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:22:44 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH5V-0004rh-4X
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:22:42 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-710bbd7a9e2so56079417b3.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538160; x=1752142960; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I9HfEXraln6KjtYBXwnUUI297bke5zf62srW9A4hCMY=;
 b=J20jD93Ql/PvTd7xxCmEblVswznu0Cf62O3K8wJQA0y782s7+UdALvQNWnqtk/BFup
 PRuxBfYwIIKE1NCTaCqs2BzdPFfgXBOGPyM5NLvCWDTPnTc/eqRYyRpS/3xqKbKwA/1w
 ZD8xNcOmI7MGoyoT+wXGs26pl86EcWWzJOBVOGlH/zxJt6xlF7Q9K17e3vzy8KqnVQcS
 C2l1d5xxd55TxpTUavWI7ICO2tvrbYcR/d010YxNLBUNI0JwMHNd4wJdSyvz00/fr5MM
 3SqNUyW3B8h+yC36Nby9RO9Tqu574tBNKyAmnMJE3YMs4G0G0RkwlfQWXoJJaqi+ZBaS
 7RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538160; x=1752142960;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9HfEXraln6KjtYBXwnUUI297bke5zf62srW9A4hCMY=;
 b=W0IqqM1gfUSPO4Xk2zOK3WddJlRKH2oDff4+8n3L+FGqay4nOTI3UIN5R2N1L5OqDn
 MZQ3U3uxPWwylMY+WazkUUR6AQ81Yaf9NGm57zBt27B5r9Js7SBph4US4FHK/TKhDuXU
 ndVXnVykJGufT//RLqAony/Pe8eTxT31HTUJ/MEniXWpJihYzWlBoK/4WfrwJc8KkFJH
 vFWaGkOLxUeYep8XKsf8IUqUupYrumJgibyWCj6mYeSpIvXwFgV9Hn2h6EywYtGg25tO
 2cU37LyhOr1wTma6Bwf6J5u+bkSoc83tpAfFKVFQzLrmwFjw2n77gUXozHwRy+AXABZ+
 vN4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn5l9IgunP2qizL0BDY5Uq7Ia9fXY7xZRmhI7Q7nYfWSLTuk4nr9ugW7gMSLxXKQufF30Hmd9ZQg==@nongnu.org
X-Gm-Message-State: AOJu0YwS/R3VftxJzJERhc4H9iMhKdY9kiqpM0HSip6Vc5FHEYOEU5DI
 MsD+EGBt6Qtyt6EwpZFjmQaj20WUmfEEF8ilFo+qlz+WFtoh6PjnigxUS+1DJrBtq6HS79xVyrb
 hGxTHpF6dTluyStBaaOj+Iwvw3pS2ohDEc40E71F2nIzWCOD5hnuc
X-Gm-Gg: ASbGncu47GRj7FSA9djrTLZ4PN3361ZdMUjci4Lb9zykHnrZZ5oYJB+XRQglYFX1Eik
 2WksfqoA4saDAXPrRsjWwlX+WAxdPBFxM4BJaloinDiAKcmyEQ1yTYypAQZ0mH3ZZi2JbnnMOGo
 xWZiF7kI7HRdrM46NbWL2dE7WvEb/xFTE5TNn8qAVW59UC
X-Received: by 2002:a05:690c:9b0e:b0:70d:ed5d:b4cd with SMTP id
 00721157ae682-7164d40a08bmr77133257b3.17.1751538159580; Thu, 03 Jul 2025
 03:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-51-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-51-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:22:28 +0100
X-Gm-Features: Ac12FXzANywrODbQf_xvVTJf1VcpaNP4MAZKBjsp-A3T3LD1_Q4rh9GdJZVRLaM
Message-ID: <CAFEAcA9XA5oH6nY-mASbXLE62kKprusjQt9NQVon5qNPntFqRw@mail.gmail.com>
Subject: Re: [PATCH v3 50/97] target/arm: Implement SQCVTN, UQCVTN, SQCVTUN
 for SME2/SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-TUID: dqH1QLhqv88D

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c |  7 +++++++
>  target/arm/tcg/sve.decode      | 20 ++++++++++++++++----
>  2 files changed, 23 insertions(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
