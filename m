Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1300169ejh;
        Mon, 8 Apr 2024 07:17:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4BVLg2gFT6EOtkcdcPLDq+SGrsdrj/BXze+8YE09BL3hk3Yp2OpDIvmH2VauZJHz/BJcy7UdipVhE5DS58LJmUYpSHlRO
X-Google-Smtp-Source: AGHT+IHVwJSl7uwHibu8iBoIn91pdMOLRykFJmGb9ja9Qppe9xsUuOm52giGo4Ei2sK2NsGRNFS1
X-Received: by 2002:a05:620a:122d:b0:78d:6ae2:4416 with SMTP id v13-20020a05620a122d00b0078d6ae24416mr593287qkj.77.1712585877878;
        Mon, 08 Apr 2024 07:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585877; cv=none;
        d=google.com; s=arc-20160816;
        b=Idh+3UbJ6fTBKEQOMZ4cUP+XopYMQIbiNgOgJN8QoXZg16aUJ2dxdfz7D5Jka+yfcx
         G2+3ZykAumKlb8W33Nx2l/gmVHiA8HZi7RfJGFHP3+rJwQiLaCf+vQ37q26ppfAZAaOx
         S/SmPKcZ9XQFXJ2jWUdEJ+KBb00HtVCK8J4KElTyB1N2Z9Opyyf4i/QfF8ZetmegaHT+
         Gil0n51i2uHGVq3dBitPE7WZJxGZtyJkyJWGrUB9vC/GX2Vf4282y73IE//jcu+TSxnn
         RoDQjUrnUDcQgAC9sSea0ZGDtFeNWtGsVxKkO3ky4wUMfq8cogQe1vtTrobrSUAoE9IY
         socg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/7W7IvtAkF1IEm16XTVrZzndvYUloGN8MiRSdIzHpX0=;
        fh=7L+A6MfrYf5LvpIf73m5VSlL0ixvLLjRCRE+7H2LwcA=;
        b=FsZzkhji/W8M09+p+/Aez7QNvLFDwcweS5qUEBW74wWck04vOSKM/6GJQOUbw1way1
         jhqs+cbI8KbZdvOA2BntSEAzB954RTb46/ix0BS9p3RO5KVqSJBFZ8e5PvEKBBACLCX7
         7tqD/p/459OqZ0s7QJQlkgmvFNidNH9sX8q+gbymWgjho5lWhKj4HlBbqNT5Pus+NrAz
         M9dOvw5BTdAem8wqqwCDCbNeT2KUxKBpDNxX7HZlyhYkcB3WjY2HlPwpY5v06eP/8nCC
         wOF0W+yRDVHRMyOH8UGgcaUdF5/cSrRRrs9Pi6rxggtELpZEDiC8d+Wi9cig91UZ6XZf
         k73A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RqqFru+F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee21-20020a05620a801500b007887554e509si8827673qkb.492.2024.04.08.07.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2024 07:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RqqFru+F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtpoN-0001cK-TQ; Mon, 08 Apr 2024 10:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtpoL-0001bZ-T3
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 10:17:26 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtpoI-0002tl-ON
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 10:17:25 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a46ea03c2a5so759633766b.1
 for <qemu-arm@nongnu.org>; Mon, 08 Apr 2024 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712585841; x=1713190641; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/7W7IvtAkF1IEm16XTVrZzndvYUloGN8MiRSdIzHpX0=;
 b=RqqFru+Fw+a8c08ULEP7UFSXEr32xwoacidzK1kiPPr3dkNFWq28iXGHfjPEhNRZ2j
 p49OQ9gXfDJis4TtbJNj3K4/D9wj+Bur6VZdBM/SCozyPkOwQSdWiWbfnTyKFCUE5ct0
 7DpTWsb+Fx1xx9/tkMq5Y5yGciACmqJeVts1hpJJ9t+GKNPmRrRtHPnF9jm5yFw0O7xq
 slb838ABT5WmVjYrdkiPEYyLja4BBhcN7VSMXYkXBQFRLfjhGrooLZ7AvDDOoSoP/pEf
 bXjiUiE/uj40zX96X0ucxkJYVvD1XsqHnO/KCYeC0nRvfMp0TMEhgNHhAl5Xr/kVW0Xb
 EI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712585841; x=1713190641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/7W7IvtAkF1IEm16XTVrZzndvYUloGN8MiRSdIzHpX0=;
 b=TefNTYSmuXXwq+4l7DMMFNfBHXRhngnY0NdCsLWKrbTA1OldrEONm0ZDXGgDznb874
 HTkdB8bB3FwZMlc+AVIpOxFck/iyXMqpjKcVKnqcPy2BS238qf22Q+sj/orRt267I1I2
 hsGTFFM1qnvCBHhHTvrxQzg0TIC1leNNx/y4EmMu6gTxALoC3QksNhp3gDWMAWt/W5Xl
 yXvfnlkkr/pyMCsVkoBe79i+O1fWTijDSJ4uDXCBvkZWSz6r71SJUllAJHPlU4D6xH/u
 VA49ipACUONzGxW8ClNfrmoFAY6g8sJ8BcDT1uAof1zun3tMh8SHer/pUkF39qMWt4b+
 QaEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6+VRxqAgbTlkF/zwEvEEbSkeFX8HSqa0RkW+WdOgIEeSBZT/kT2SQU7BHjFgFfYIJJoGfDAMaXBf1Ee+XnyK+1gMH
X-Gm-Message-State: AOJu0YzExt/FoaqWri1pSi6LWsM3nVuECs/1z3Y1YFkjbd/JNXajT3mb
 1VjkmFpxR9uVa56E5CjqF2yIjTQkeZ9op4SBZ/sxDzuSlB4UO211QPGn24tBCJQ=
X-Received: by 2002:a17:906:6a17:b0:a51:c1f7:93 with SMTP id
 qw23-20020a1709066a1700b00a51c1f70093mr6070542ejc.13.1712585840900; 
 Mon, 08 Apr 2024 07:17:20 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.144.67])
 by smtp.gmail.com with ESMTPSA id
 en1-20020a17090728c100b00a51adace6ebsm3895589ejc.79.2024.04.08.07.17.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Apr 2024 07:17:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org
Subject: [PATCH-for-9.0? 0/2] hw/sd/sdcard: Avoid OOB in sd_read_byte()
Date: Mon,  8 Apr 2024 16:17:15 +0200
Message-ID: <20240408141717.66154-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: k9IBPl1mZgcD

Since this is Fix day, I went over this old bug:
https://gitlab.com/qemu-project/qemu/-/issues/487
It happens to be a QEMU implementation detail not
really related to the spec.

Philippe Mathieu-Daudé (2):
  hw/sd/sdcard: Avoid OOB in sd_read_byte() during unexpected CMD switch
  hw/sd/sdcard: Assert @data_offset is in range

 hw/sd/sd.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.41.0

