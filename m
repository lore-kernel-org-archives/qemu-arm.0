Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2955657njc;
        Tue, 25 Mar 2025 15:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWn5M/ruajkuYGXyQM5CWFNdkXRwP9YvjBjWwKfCHjo3gTW98pT4gs7jt8hWFY3Bo7tpsqRvDgr2r4Crg==@linaro.org
X-Google-Smtp-Source: AGHT+IFEC6A2fBuV8NfSaMYSl6vJx9maP8hDsQ2hm7N9ibBxMwI6LyUadcmQsfjKDvio8oZAlHnG
X-Received: by 2002:a05:6214:1d27:b0:6ea:d393:962b with SMTP id 6a1803df08f44-6eb3f2e297emr328610066d6.22.1742942689996;
        Tue, 25 Mar 2025 15:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742942689; cv=none;
        d=google.com; s=arc-20240605;
        b=Lh7Uf3AM2unsOZITe8MHc8BmWFWhBBrmiV8a2Gc2pINC1ZIK84YxznSfwuJNKtQ27j
         h3RqUVslr33IPFsYTxRnACIIKbUY8LSGNfAgHOu2lsYkf7u3bmrdIAMRlD23U0g50qJm
         sUOibL6dEeVE2ZH02Cyq3mZtf9F1THbKguX4FXUcLYE3zLshNNU2Blpj/gsETc3huHUl
         5sEmEFli1/upxYrEMC59XR4TlKe1vpfUewRJr+0FSVzIubdq01F3kJ0FD1PbCUGiWoyH
         ts23eadPDbkI/VxGkGy5piLFPyslus6GeQL+BrgOW8f6M1WG80SxCs8DaNeGukN4erPO
         076g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DK+uWh0VCKgLvFlRmYU1/+eCsypc6Q9Oe4mzDQEUpcU=;
        fh=mW1Q0Ozvt3OYZSPetfKS4v23CGXlqzaToexXM8Xohuw=;
        b=UbE4qJxXS0vkfDKDX47OxX7hx5PufgGHzs196e9dz8T7j205Arup0aqtpYaUkc65+D
         2dH0O2ibEqPeZqDrRgNBTwxsS0zE2jqe5/sJj0J9M8LFP/wO972lOPMiO7Y4ec8a47Nf
         3FDu/PmKwvINHYOo8+bhdEMKkVh2Ffhij5VOjUW8aAkqHLzLlti1dEgclsVrQEQi8i/G
         R9mLObXhMd6AeOlgGzvmSn410Okr9bobD6gi/uoEo1JNN5kBi34vn+CX9tRWlFTFdDTF
         A6qwgfImkNtP2+bqZk5Cg7y+SQXlpsGMfgyOFWbdNwjGa1avCh39e+Jp/1NRpAaToSeH
         Tsig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uegHxEdl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f018ea2si100311386d6.269.2025.03.25.15.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Mar 2025 15:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uegHxEdl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txD0N-0001xy-TI; Tue, 25 Mar 2025 18:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD0I-0001aT-Av
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:44:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1txD0G-00074I-87
 for qemu-arm@nongnu.org; Tue, 25 Mar 2025 18:44:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-399744f74e9so3929567f8f.1
 for <qemu-arm@nongnu.org>; Tue, 25 Mar 2025 15:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742942651; x=1743547451; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DK+uWh0VCKgLvFlRmYU1/+eCsypc6Q9Oe4mzDQEUpcU=;
 b=uegHxEdlSfbpWcRVBdukpVBBHylh13PVvAPZQVcJbbRjyw2yWCjpAszeIwck3tjbtS
 5x7zQcKDEPatHXomGY549ElqZ9Qbstcjpv+dTbVZnLYhi/gVRRl3tt6vfV4RwOru0Mwu
 f+byCT/Igsw8GdRNXLZPEg+2ZbXEPS2KZNBTfvF/zW6zs4Tb+SFGokvrY6FKkL6izLJ1
 Rj7xEccrwwl9f/0XPjKURTSA1xwIjPiApICUTX6Ay34Cg9gMrX1rl6Mg/tXoZZO51Eue
 4HtW6NO4kPkU1vP0Y13AUn4wpU5jXswwM6M5FnmopmB7T+YAsVFqU9Wv7Dae6vRU17M2
 4h2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942651; x=1743547451;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DK+uWh0VCKgLvFlRmYU1/+eCsypc6Q9Oe4mzDQEUpcU=;
 b=pV9EmMUBErH1ZMKN0WVmXybyuOfb90f6wc7Oy2iGqm+eqWEuHBDlg6Iledef4LK7w3
 2FJNAQa0K2VhlEr2TkU1wOpmqvxiIpgjH9HlkYGMFnvDs3kiqvkjqbTTXGbIx/pMy4v8
 CvzPQDPVzslIBhw5zmX++OG6GUydZvb5YsiUJD/wxP0+Xlnes9KAQMNaAF4LneuvwXjH
 utv9lxL8yVXWB+FoD19gqnzWfEr4ziZ7WJH6FksYdaBB8n2KedKE240Pn77BAPFWYb0l
 ELy+q6P8jzJVDWYcjuevustvFTSglEfn2/Ud3nFlmrkZ6Nuc+Q4zUXmrDl2SOql8TE6e
 qLzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHVRrRGgTGFOWVqr3WlJCX0m7PJ3SwOQMzR/VUfSxg9fcwyXIxrVNBOxfGTPaCdxja1xKstk9M+A==@nongnu.org
X-Gm-Message-State: AOJu0YzsgIoYbC6JU478V6HX20efqAMTr8q0iVl+A7VPAz8zkObq6Byx
 YBQUATkeUm0FYl46AFJVRFZdAc4L+JZ8NU8+ECVaDYcJLcFIpSy5Mlz9MsvKxLM=
X-Gm-Gg: ASbGncuN3fKuRC4AhZRJfp6LT0kl1AdwxIAa5D8wR6gLudTWSkK1FQaLUlXo+RUFlwE
 qkvpyFARybj7hPfws6MBSbZuw9P9hyWJdFM7yrL8CPjl/BNOaHSL3LhZ0s9FR/vcHYNqLs3HFl3
 5+cZGPgDIUGm+AiUVhgPTIeBPUfkZw8iTFzhIPnapzVb+iEYLPK9qKKV7swA47QoZgjvbjMjadT
 Npub1fHEQl4m/LvorJU//Yve6/bEo1pDXqWH/rtJY3ULoz/cKWc7bc/h5vSLloTQoKBuTJ1T3z9
 M/f4k0JkB5edWozOkQEHUInAMM+sfuymV59Gxk6MNsEu59zssgSDxfhgjlC2xljdW0U+jbJEr3G
 2lIEa71Qq6/MR1VD+YiY=
X-Received: by 2002:a5d:598c:0:b0:391:3aaf:1d5f with SMTP id
 ffacd0b85a97d-3997f9595f6mr16437604f8f.52.1742942650628; 
 Tue, 25 Mar 2025 15:44:10 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f32fcdsm218803915e9.7.2025.03.25.15.44.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Mar 2025 15:44:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>, Samuel Tardieu <sam@rfc1149.net>,
 qemu-block@nongnu.org, Patrick Leis <venture@google.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH-for-10.0 10/12] hw/rtc: Categorize and add description
Date: Tue, 25 Mar 2025 23:43:08 +0100
Message-ID: <20250325224310.8785-11-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250325224310.8785-1-philmd@linaro.org>
References: <20250325224310.8785-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: tMxUFNxFSk1H

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/rtc/ds1338.c  | 2 ++
 hw/rtc/m41t80.c  | 2 ++
 hw/rtc/rs5c372.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/hw/rtc/ds1338.c b/hw/rtc/ds1338.c
index 8dd17fdc07c..56162917c1b 100644
--- a/hw/rtc/ds1338.c
+++ b/hw/rtc/ds1338.c
@@ -230,6 +230,8 @@ static void ds1338_class_init(ObjectClass *klass, void *data)
     k->send = ds1338_send;
     device_class_set_legacy_reset(dc, ds1338_reset);
     dc->vmsd = &vmstate_ds1338;
+    dc->desc = "Maxim DS1338 RTC";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo ds1338_types[] = {
diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
index 96006956798..55f52d95c51 100644
--- a/hw/rtc/m41t80.c
+++ b/hw/rtc/m41t80.c
@@ -99,6 +99,8 @@ static void m41t80_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc = "ST M41T80 RTC";
     dc->realize = m41t80_realize;
     sc->send = m41t80_send;
     sc->recv = m41t80_recv;
diff --git a/hw/rtc/rs5c372.c b/hw/rtc/rs5c372.c
index 5542f74085a..98067ad06d1 100644
--- a/hw/rtc/rs5c372.c
+++ b/hw/rtc/rs5c372.c
@@ -216,6 +216,8 @@ static void rs5c372_class_init(ObjectClass *klass, void *data)
     I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->desc = "Ricoh RS5C372 RTC";
     k->event = rs5c372_event;
     k->recv = rs5c372_recv;
     k->send = rs5c372_send;
-- 
2.47.1

