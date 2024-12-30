Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp7913819njk;
        Mon, 30 Dec 2024 07:40:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWs0WHH6ZH+CaiaD+sJHqQ451rxXRmn7qjWkw63IoXapIRn2I9P9XuTaZaKLB4FAxXCautwKekbqvRQwA==@linaro.org
X-Google-Smtp-Source: AGHT+IF4hJto4qJOYcGjEVvckQSC15A7EEf5TLV9CB8cORddlX6hbnNPzaPJ4uJcTheNc/NQj485
X-Received: by 2002:a05:6122:659b:b0:516:2d4e:4493 with SMTP id 71dfb90a1353d-51b75c3d499mr26725093e0c.1.1735573244528;
        Mon, 30 Dec 2024 07:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735573244; cv=none;
        d=google.com; s=arc-20240605;
        b=bKQNbdFeCyhhzO6IPJJ94ZnyUBbQ8TCMLyit9Ouvszfz9tBmJ1Fyx3aw2g3s5l9BXz
         IcSCrYlhoBBWF4LWJMhYOnMVi2UO1nA7CX/+tAPFjhcr4TeacnCo+weCQ2C5Ty4t+nuL
         B/P4bYhJBgO90pXQ4Y6eIU/kOL+ZVgWE60g59zgbrWAhaujM0Hqr3I+3XsjDgn+par/A
         tb06MiB9pJ1jKJXgRWc26PjWOiUa+eLsTqd7DRybyEYoevfE1P/MBRT10OQ5jXgR3aBx
         fCIb6drr9FgvD15odIAfv/c14Xa629+uZhhiJhGsy/Ix3BiftdvzmREj/PxipaLJ+57Q
         kzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Kqn0cAQx0AmcHu5Vup+xt9QSQKA5PMZMIOpGbeQbdm8=;
        fh=3n3z8hK2spqZaVxiEbkk+Cxmug822zaoZpCmkZBJ568=;
        b=aIfiwQT9qTcbdHYOSzMCVH1hhOtIaPQDg1tQupRtN2iLW/7aIBefhh3drBdKFV8iYj
         pj4aRINxNdzf/xDhNACO2OJyg9Oqvxc/YxVCn8O2OzrEFxPDatu7EdE1v7SKnVqNOzWW
         yottHauLZk0tSjhQve57ZQA/iVzZ5P4b2iJXyIR/W6IoopZ+Gs1YZtVLrGFB6GsBXXQy
         KtMWOY+8Or2UpLCH8X2WDvLDipMS2u1uoDHMAqVXi7EVe7G3KjxGLhjiIXHDzfFUh0jB
         Bnr0L3da6y4cdObpxnEwJl1SMSQlsRELfjt28O3i36hvnv1bomHR9r++0fqGj9cgffmS
         4d9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFJ+SBrJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51b68bb52efsi7712164e0c.73.2024.12.30.07.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2024 07:40:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFJ+SBrJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tSHru-0000mS-HZ; Mon, 30 Dec 2024 10:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tSHrl-0000kE-9g
 for qemu-arm@nongnu.org; Mon, 30 Dec 2024 10:39:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tSHri-0002yy-LJ
 for qemu-arm@nongnu.org; Mon, 30 Dec 2024 10:39:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so97469315e9.2
 for <qemu-arm@nongnu.org>; Mon, 30 Dec 2024 07:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735573172; x=1736177972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kqn0cAQx0AmcHu5Vup+xt9QSQKA5PMZMIOpGbeQbdm8=;
 b=wFJ+SBrJhYThojybgE+bD9imCt8eNCyqS/Xp6iUDyZQyRj2cWCl3M636OkCYuGiV2d
 ZfJ3sjnKET2Y2xSg0hogjIGvNuidFHnc7+aThsDgilnhS7zwcyDh4EzjBXwogCBqf2uO
 AAy4xdubYrxamDVWHFBZcKV7bcuKjKFo6kviwi2x9w0Lf5c3t0JbZ8cDHzvrBk+oScX8
 nqw4mmCGUY8DUz83Mng9DM9tNORftw7e1sNrBZGGwMaTo1I6+S4tD5Qgl7CKEL63H/ge
 NO999CctOrQVD9eP5JC+GtfiuA5WzI8S73IFUhy25nY3I79zjw4Ly7YXIHk3cQzgV9zU
 /r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735573172; x=1736177972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kqn0cAQx0AmcHu5Vup+xt9QSQKA5PMZMIOpGbeQbdm8=;
 b=vyxYHaTZAIslJe6XUqFQcW9YrZnhGUzdQvxpMwhcRdx57erImvWg28/9qL4p42NlkJ
 EbdB4NZk8QPx5lD9ojuBkXp+/rvMOS+Riu5X92Nfv3hQjeHwVqZmCe+3SxwhCp9vACCX
 E9nW89IGNnCN4IjTHmMGuXOaeGyE202OAYXwK4DKCSmb0U6uHnIv46FcLVO3pth/nGUI
 HayqX52Jw9Ob0QrFlcVX8scEuBEqSvE3N91wf5aMdYT3LUuIlosxTJlyIpdkkvzX80DJ
 wECehfz2c02LoUHCM9U/VoKTWt2UyWxEENrvZa89N9pCjxBdUxBxh1peQvWL1FCt/ntK
 yLIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+duxUvCLQvWixX05k8R54PtknhIp0sPyXWzD5RqRX74M8q9JO/WzewENX5QqJutoQWGGJ+gXNew==@nongnu.org
X-Gm-Message-State: AOJu0Yz1W34r8yh97kIrgygvKoh7y/cF0f5dqcTbYDPLGqbOO/mJ7107
 g7Oo8DjeNaEwjmu+SRMZ1YfckahABVShP544/F8TJrW6I5qqi+NlSeialmKi9Fc=
X-Gm-Gg: ASbGncsXiBHps936PLdqzluJ/curafeVewKWCM0YWW44sKnhtjVp/sgErKrf8wxvCjn
 C6IQjP4pBcqHW5T2yBirUammZUf31HBnOMoVSGBeewBUlTAGZ2pqKR/WLxRyZSDcwG2isiCQdnm
 noZtQAvraFZY9TjwMWDIGXieTlIu5UzhQbjPinuWrUedM/G7igD+lI0dJkYHTb7l13glcFoVON9
 USNBhsOLl6eTK4I2odfrlOf/xigN99wUDJxRVtyJbOChTIEeVzKaN5HqKCgQYMsl87qhpLsO8er
 1utYvAurYcvXWigVPqT+4upVP8dL7xE=
X-Received: by 2002:a05:600c:450d:b0:436:2238:97f6 with SMTP id
 5b1f17b1804b1-4366835c1ccmr240895605e9.1.1735573171924; 
 Mon, 30 Dec 2024 07:39:31 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b119d7sm392047955e9.20.2024.12.30.07.39.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 Dec 2024 07:39:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stafford Horne <shorne@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-ppc@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/3] cpus: Avoid re-initializing fields cleared in
 cpu_common_reset_hold()
Date: Mon, 30 Dec 2024 16:39:26 +0100
Message-ID: <20241230153929.87137-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: 60a0USEKAeG/

Having this call tree:

  cpu_reset()
  -> device_cold_reset()
     -> DeviceClass::reset()
        -> target_cpu_reset()
           -> ResettablePhases::hold()
              -> CPUClass::phases::hold()
                 -> cpu_common_reset_hold()

If we call cpu_reset(), common fields will be reset in
cpu_common_reset_hold(), we don't need to manually do it.

Remove the pointless re-assignments on CPUState.

Based-on: <20241230152519.86291-1-philmd@linaro.org>

Philippe Mathieu-Daudé (3):
  accel/tcg: Remove pointless initialization of cflags_next_tb
  target/cpus: Remove pointless re-assignment of
    CPUState::exception_index
  target/cpus: Remove pointless re-assignment of CPUState::halted

 hw/core/cpu-common.c      | 1 -
 hw/misc/mips_cpc.c        | 1 -
 hw/ppc/e500.c             | 1 -
 target/arm/arm-powerctl.c | 2 --
 target/hppa/cpu.c         | 2 --
 target/loongarch/cpu.c    | 1 -
 target/openrisc/cpu.c     | 1 -
 7 files changed, 9 deletions(-)

-- 
2.47.1

