Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp435755dyc;
        Thu, 3 Jul 2025 03:26:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPmO4X/IHFhLAXUswtd/3pD/bQC555wZan0b138087KhE6JUeFXtoxVbKj6KI/3Jo0HkCwfWUpQvm5YQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGrcSAkqZgLo4OB1Yl4eCF6KEB65ILPFnqFkanO0Uds1wk+u38rCGOWGKe6jSdTty+QV0yM
X-Received: by 2002:a05:622a:142:b0:4a4:2c92:27e3 with SMTP id d75a77b69052e-4a976a27527mr102498541cf.34.1751538394749;
        Thu, 03 Jul 2025 03:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751538394; cv=none;
        d=google.com; s=arc-20240605;
        b=AqniwNj1TRULW7sLu4VujRFLZ1CfRHFMVyBOjOIcco4aKLsASx90sm3imZHVe+p1jv
         nz/IUbNLz4gioCydsDsimmhubMAMDLBazom9xGPl+uWkbYhYf5aBrVFZXAVvGBalVbFq
         DgBzeqAKOi/sttIK+WfwXySKGkcYqJjA5SRfh/JYIifBnuEOdEAsyY3hI2XHfbv5g53q
         faKxPXTpUlDrCh4XJToUWf45QDMdJ25bQvjrwv2joOLO1bRlnH5j4loHk3FpwvT3JDeT
         zrhuCiY/W/VXSni6Uikd2zaf0IP4rNrVZ0648mgvig6tXzMKbka4VIepl9hCHqmjnaLC
         IZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nr9MwXDaB1FFBDR9dbh+36PwM0OL03M49X5U6t/O3Ek=;
        fh=bSdnXw+znutqfwT+MBW3S4SWSXVWorYUU/fNG8xHio8=;
        b=RUC7aftj87PNs57KT0G57Eq4GAGCwDvwNXusPQmzf1he4DxJXLf+i0HOCsAZGD0Rh/
         wxdpG6Pmxg4FCm12SMpeS9jerwfmMeSMqX9OZC8Jc6qTM8sJYcp4NLDQaILBW08Ti/0b
         zQP5chqBetFQdLXt/WAqsMscgzEghQ9lsah9JtHc4rMPZxKwQT4im0WnQ9iYH8Noljb6
         qo8q1vVOhsKVRxiImEQho2KU3PBrK728qbHjkwLCK20ld+p7YunY1AuVwk19c93/wJoF
         ahvN2RF288tALzABz4+VistU7fD0/2FHdMn018JwKwunftjaRUmyLcTYl95xbbcWUmz2
         STsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rGem46PD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e7004si142188351cf.267.2025.07.03.03.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rGem46PD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXH8r-0002hq-Du; Thu, 03 Jul 2025 06:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH8p-0002hX-5S
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:26:07 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXH8l-0006II-UZ
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:26:06 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e897c8ca777so2120426276.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751538362; x=1752143162; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nr9MwXDaB1FFBDR9dbh+36PwM0OL03M49X5U6t/O3Ek=;
 b=rGem46PDFV3Wa8ZUUKCqQzUEOssHiOswj7trR7LizIWa3oXnwg6wc6g9KFdvzeMKtL
 nt2Yw1RF0APK0NVPBFvGWSB5xllYyiiYPzMmWdg7yjeGTjGb95wsY/y2NrG5q9i3uwsu
 NFZVihY3U1NhwEYcZW9OSgRQ5Z6khwObSYfuCdFaAaswER9F7HqhrA3eDoDOWuWan456
 ZF5BNPZUrSTxN0h+nuFKp9+Tz6hj/uAQXeZlTGJ6pnDZXAfSTq4ppH56OZUnH1NB1qM8
 eAOkl1RiXp3BBoofQ3yUcro/KTGodSgXx5a8yVhPCy2DBdBlFMyzfPB3vLdJ8kYxnWbQ
 IYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751538362; x=1752143162;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nr9MwXDaB1FFBDR9dbh+36PwM0OL03M49X5U6t/O3Ek=;
 b=w5mIGv1wt4b+JvTRHeRRoMEuma9E0UdyidMbyg3ezSX4kSfsQXh7yEksfuhWqUZwCn
 OAvHJitWCeQv421HojydqLJmq6M4IV1w/fTqkLpnfublh/SleuYExVACFSF3/UUhjSd/
 4qaH8szjoOEDyBko0J3wxnKWRQkrp7F9qmC0DlzniC69aIsSl6fk4TKBSvZeoY0CJ2uy
 cpiXwAhrzCg7dYuoXqetVmwMdhVWpDvoTyc2rTyf+NEUEu3buNaMJmz+BC32Y0P2+o6v
 ZeF2OMVEAQu2YvwDy5k3eIMuugWvwUZxJTOcquYHpDA2Xuk+NBB1X1aCxIUJKhfe6tK3
 s21Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtRm9/2hSYUyQAx1c81mIotGUbGQaSyOwf4MyE1xcmiQSIobJBnXeBfSIK7Cnn2IHThCohZ/5V2A==@nongnu.org
X-Gm-Message-State: AOJu0YwlPCVLyO9/W8tO3CNKvBdrgw3Enk9ia/IBC/rhZ37fRmrEsICc
 UNfhllS49Y0rxvh9KpRLfZeea1cNLy9+ALPxqKa6WD9VbG5KRlLHHyhWbMiE12U+zlxY74AwWxN
 rxIoGbKmL+zU9+ng7x9po1g+/HlUkss7opZwNj/cAZg==
X-Gm-Gg: ASbGncuGKpneI9sjca//9MdqE/ntvdfGYLPTEVbXqHvQu33onV+jqhgw3wviGOoTxtl
 PA/EX7P329GZLFGbtAbfQueltW17AqG/kyp4wLA71G3wRM5/bMXzAsN1/AsjSsaxDD1B8zfjn9g
 WFBxZdKUWVkkUqLIOIAPqElVnyAkz6/nF0VS9Q2t3n3CvL
X-Received: by 2002:a05:690c:46c9:b0:70f:6ec6:62b3 with SMTP id
 00721157ae682-7164d52355emr86088067b3.26.1751538362460; Thu, 03 Jul 2025
 03:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-54-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-54-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:25:49 +0100
X-Gm-Features: Ac12FXyIezCZUJMjbQXPpcgHGBFoS2LmTzBzlvtq05eIk03ZZnevuc4FQ4xIrBE
Message-ID: <CAFEAcA9nJfiYGxDjuSBKAn2qmV_OiVyJn5NgnUFMGm1eXyJqFA@mail.gmail.com>
Subject: Re: [PATCH v3 53/97] target/arm: Move do_urshr,
 do_srshr to vec_internal.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: uExYFV09N8i9

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Unify two copies of these inline functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
