Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp4262583njh;
        Wed, 4 Jun 2025 10:38:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEmWaF00S4UNR+fpyf9IuxCSjXLO8c0FPaL4i6KNEtqSjJoNJF/8LqntmTV9ceVF+Bg2jjtgabNfZizw==@linaro.org
X-Google-Smtp-Source: AGHT+IG9Z4gJUZOVEXS8nEXgeAnm3ajS6xrEAtEfP3RoBgLk+b2uwUgCUzEbvBPN0Xps5XN2lp/Q
X-Received: by 2002:a05:622a:4109:b0:477:c04:b512 with SMTP id d75a77b69052e-4a5a576ec0emr65508651cf.16.1749058686986;
        Wed, 04 Jun 2025 10:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749058686; cv=none;
        d=google.com; s=arc-20240605;
        b=HC50ruq8KYw6Fu/LF4uxS1eIrEvS/gNXAvhKduUOwE7d7NIlu4PQHe6guqM4cuGqdw
         8IEr9bIBg/725WPSidNFYajxSleziBKr6EahDe7RrUZfV0vn/wv0Gm3GfDEuaDsF3MHR
         qPgTVdCtr6PZ6e9VmKKojqItWrsqVRRTw/piaIRS1yx+7ecagRNy9WomgLH/iUlYrG/B
         O7AFY2qVueTinBY5kXPlEgDP9CXZJdPalAiiRS+t+MwAvzYGxIBZktwY+nt2JdNhZX5w
         +iL6mgRQL6thugzyujGI17zHI/ig8Kv5H6KRh6FijSb4U5BEnwEj1Fg/UQIUJJgOefgi
         Ta8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Fw9sDrI+ehvF9ezi0jNsttWWSTwhQzTXSsdjQJY/UXc=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=IU3CS/eu3ZuhjQn8+P644oF8nq2W+oZanvQbyGNqOF+xJynYL2Vo5j9nswmwkS6oN8
         PLuyFLUubAw4yo6tDo00k5nRb8/HaM34ZTXBSem5/HxgnXbkCsCpdHfazJ9zpSAVrQ27
         qTf4c1N51JKX/IN7w5Na/ubJfRS+aGnPwd48EQaDwtm9gJ8r7/zOe+bUAl4DRQa2Gqoi
         bWKr7dFO3NFfYgyjWjuiT0Se1sl3GzEAb+YoYVJX/HnkBvsF5xgs9n3Aj9GeBGD10aid
         1ZUN/kc9BgU3+K7JkyhQGZoMtJLGgOZ5DtoHG5m/1Zh2nLm/bR1191Vheo/8mCZI0SKj
         67KQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="j7/zqjOb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a435a4adf6si164996571cf.438.2025.06.04.10.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jun 2025 10:38:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="j7/zqjOb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uMs3l-0000GQ-S3; Wed, 04 Jun 2025 13:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cocotroupe20@gmail.com>)
 id 1uMs3b-0000Fz-Dy
 for qemu-arm@nongnu.org; Wed, 04 Jun 2025 13:37:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cocotroupe20@gmail.com>)
 id 1uMs3Z-00030c-M9
 for qemu-arm@nongnu.org; Wed, 04 Jun 2025 13:37:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-450dd065828so335015e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Jun 2025 10:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749058658; x=1749663458; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fw9sDrI+ehvF9ezi0jNsttWWSTwhQzTXSsdjQJY/UXc=;
 b=j7/zqjObdu0rv5rMuxkqQ54MDfBxopFidKaQSBfKwga3phF89M2uBNZpSgVdzu4Lta
 DG5i7pe801aHNCwq4OnuSXuV3qOZ0zz/oDs7VerVkiGOKa57mj4a1QmbPKuKQ3/XJw2/
 pzzcbB5IX8ornKs1M7ekuqo3IdhYnKvJJ0f8UZHUQiatnlExm24d3/kEFEoLcBjYBFDQ
 FJTu8Z/6COXluuN6sQAE6cNStp63eGAY1p+UERB8/2Uu921IvPXtn4UEpioQce/kDUiY
 4uKsZ4Qn/LZkIWlnbtedB1gyfzH0Nr6TRYeFqxIFAMunmiNIXIvKBFZMcvIxGFksuNX2
 8M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749058658; x=1749663458;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fw9sDrI+ehvF9ezi0jNsttWWSTwhQzTXSsdjQJY/UXc=;
 b=K+k1GudH/xkERrJvrMKQIxTVTSm3Ccj9pu5J8fMHLfME2JwZ5Hkh3rp0nBMLQj1QrE
 mPKZMd59yNh/BPz2Yp7J88mKL/S8DkTVMcTX3zkcOnVkGhXwW0maTI9swNI/QJgIHQo/
 i1GpLwpepLIaC4QtsvHajEt1z32/AZdPB1ygnU2QablXdRePhmyFSbURcnFGRMQS325x
 aG99PdiYFOzpoxcizJ7jFcJFIdguz9w2AZFhjWvxaHIDcTP7VKKDrC619AOYy0oOu8HZ
 m6itYUbW3KspXAtd4HUC9nZo8vMQUe0J65UIkVHVvcjU7YF0+gkQw1fLcVFAdAO0b8ES
 0Myg==
X-Gm-Message-State: AOJu0YweYOurq13L5X7l6mTV+B9EG27FNL4gmvFRUHWICt/2acgBjqyN
 XG90plN5zbhdDfGvnCxRHZlbzmINux2Q54sXeBKtsx3qTvd7iVBuruugGC5Y+nUuuJa5H0G55h1
 1mePa7oefyYKu1MGF6+050MwqCPhpVhT5sCzP
X-Gm-Gg: ASbGnctBLNZzIivNnvJqTXNVN+9f1ff6Gm7Kf8ctuNRSfOCi7iB/KRFH1Mbr4PWNUGA
 OOCErR5TWof7S1mE8dikzC5c98N6a/YGyVWpkNbIJCDCvNTiuCX8BC1PzpASlzl6zkaS2yJ/GOv
 3l1RdjnhpjrpNkS3LRf8010vT5jGN+AFzQBdZme70BetP6+hLv0TcFHe05hXdx+/WavN8=
X-Received: by 2002:a05:600c:1993:b0:442:e9eb:1b48 with SMTP id
 5b1f17b1804b1-451f0b277e1mr32554105e9.24.1749058658094; Wed, 04 Jun 2025
 10:37:38 -0700 (PDT)
MIME-Version: 1.0
From: Corentin GENDRE <cocotroupe20@gmail.com>
Date: Wed, 4 Jun 2025 19:37:26 +0200
X-Gm-Features: AX0GCFucdna23j8W5rKOIzWrU0NDoIhdfR8zmaHl83uzI2D29hnoxf2jjfl_H1A
Message-ID: <CAPwCrcOwX3Atxwzrk=Rtpya_i_STv9+Gi8uY6ryJigPvhk5+DQ@mail.gmail.com>
Subject: Inquiry About MPU Region Limit for Cortex-M7 in QEMU
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000001d1130636c27450"
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=cocotroupe20@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
X-TUID: rVceAJceiaeD

--00000000000001d1130636c27450
Content-Type: text/plain; charset="UTF-8"

Dear QEMU Support Team,

I hope this message finds you well.

I am currently working with the emulation of a Cortex-M7 target using QEMU
and have encountered a limitation regarding the Memory Protection Unit
(MPU). According to the ARM Cortex-M7 (and the MPS2-AN500) technical
reference manual, the MPU should support up to 16 memory regions. However,
in the current QEMU implementation, I noticed that only 12 MPU regions
appear to be emulated.

Could you please confirm whether this limitation is intentional or if there
is a way to modify the number of MPU regions supported by QEMU for the
Cortex-M7? If this parameter can be adjusted, I would greatly appreciate
any guidance or documentation on how to do so.

Thank you in advance for your help and for your continued work on QEMU.

Best regards,

--00000000000001d1130636c27450
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Dear QEMU Support Team,</p>
<p>I hope this message finds you well.</p>
<p>I am currently working with the emulation of a Cortex-M7 target using QE=
MU and have encountered a limitation regarding the Memory Protection Unit (=
MPU). According to the ARM Cortex-M7 (and the MPS2-AN500) technical referen=
ce manual, the MPU should support up to 16 memory regions. However, in the =
current QEMU implementation, I noticed that only 12 MPU regions appear to b=
e emulated.</p>
<p>Could you please confirm whether this limitation is intentional or if th=
ere is a way to modify the number of MPU regions supported by QEMU for the =
Cortex-M7? If this parameter can be adjusted, I would greatly appreciate an=
y guidance or documentation on how to do so.</p>
<p>Thank you in advance for your help and for your continued work on QEMU.<=
/p>
<p>Best regards,</p></div>

--00000000000001d1130636c27450--
