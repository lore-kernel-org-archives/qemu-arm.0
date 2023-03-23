Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp183729ejb;
        Thu, 23 Mar 2023 13:45:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZBpz83Mup471Pr1KrF7sl4Shk2qMKj2BHBf2SUNT//RHKYXXp4NgLrUhcXghK4YgAAIPgb
X-Received: by 2002:a05:6214:23c8:b0:5c6:ab93:6112 with SMTP id hr8-20020a05621423c800b005c6ab936112mr254704qvb.30.1679604302951;
        Thu, 23 Mar 2023 13:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679604302; cv=none;
        d=google.com; s=arc-20160816;
        b=vpZnOfSIkUuTmYwTm0LK+1AYhCyNshDarKIQ3tUtZUnyK+TPKGxjCWOxUHjjh2AEPC
         aqqtz1X3njWFdisQ0D1d4JNj0cB5jn4v+0LrPwr+WdoIpyU82sK4uHSld3YaRN1rlVvE
         6XzrCcGsVe34OU2VQvgajMoWk7+Q6XpKRr/eEpSfluM6Iw8BC0b95F6VDte5764jwi59
         blsXVb0HeY/2IIe2ltJ1ubeknEjSwi3V7lHHTdxI1htAFXIHXn3Dk3he0W/vrNDLqmX2
         Vh415peLBdPRUNiDH4mboh6C0a7ZVNOOJZpuJG55ZT87yQLfWv+OchF+eOZSqzavh+/C
         4zYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FPKiv4Av7DAX9okuawoFHj/Q4H5V/HnL1U0OAze6R6A=;
        b=V4Scif4XqF9wZWZrxoLpE+PRh9ID5kerQg+IEddztjNPj7tJYJkiTtD6qFiG1xVRBY
         uGcYPI6dzMRE7w3PrTI9cj5rphJfkovM9FVQfDOoxU84+lmihpr2q9K2oKA+x6WSo1sG
         jOyP1/fVB25pPUo1qeMIVFrwTK9kLtSi5Z2qFeTjidDL7+cyR6cwEFMpfvJDQj+3B5fz
         wx+ixWe9XLMzEKNrHTARIdHspN2vCOn1sbpxTHnAYCtxsOMoRn/kZ6fTpsR49L1GAb3c
         qf6jv5/bZ9GJTypYKn70e7r68x7dmNO2JE7xmj9NyoQiWTLOFREN4e6J/402qbsHnCpm
         vmtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GFkexIHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a0cfa8a000000b0057e60499689si11997671qvn.208.2023.03.23.13.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Mar 2023 13:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=GFkexIHL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pfRnO-0004LR-S1; Thu, 23 Mar 2023 16:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfRnN-0004K8-74; Thu, 23 Mar 2023 16:44:25 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pfRnK-0006sR-7k; Thu, 23 Mar 2023 16:44:24 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-17786581fe1so23887343fac.10; 
 Thu, 23 Mar 2023 13:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679604260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FPKiv4Av7DAX9okuawoFHj/Q4H5V/HnL1U0OAze6R6A=;
 b=GFkexIHLBI2Wo7k8NTIHWT65yb7WV5wiTX5waO/ckcRp0aLTAs17fTCgm0ETxekFSN
 7rP7NoA9deJBFlQDrBztAP+HvmGcDehGwXpIApUCaObX9mnLPOQ/58qQtK0W/i+DZMJ1
 muaFtH/YpTVk2CRsLpoiCZXQFxuOziVu5il5YbcFy0dbKZpO0B3mRj9KGxZYs/on7fup
 qpr3O7gqzyaarRMZKjd7xLbhI0pNq12i9NQCvUzyvNAtsAG9s9hb+Qy03TkZUQZz44WJ
 SlZZeocTWvW3QoRskjuPuGKkiwyqMpnqOzHT0iEY4lgqSlyO2jFaovNnOhm8gUTZO9UA
 +DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679604260;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FPKiv4Av7DAX9okuawoFHj/Q4H5V/HnL1U0OAze6R6A=;
 b=jVFkcmbGdpuaex2N6zoN3hLKAU1EDUnB7W+QudbEC2ceEu7Bj6rrzzWbeZLXWlh+1n
 tPqUwnSF90VzBIXDKzjTheXfse8xke2rJ6elB76f2jOXgHHTf/u1YT38XZMSqhA2Wo+n
 atw0M7F9p4vMY/xhWecrgXFJ06DWnv8CMqyg2KHCSGXOetRSeWnYv+ZgYGar2shsKEP8
 IOYtSouvIjIHr1IUkowN3RNK0txBqiIyIXOcGva/CI0nhNG1+0hAp4JRmjUJK0ZczlFw
 Nlrn30zNN42Qi09d3RU3Gs+KX+e2xJm/OT9kojJcACdY25b26muVv61PRYDxf3ocwcF7
 omSQ==
X-Gm-Message-State: AAQBX9eMZxAwec/sN87YJilDZbb/QB3JFPXRNd+H0fyagHSD4d9uTG2E
 E9m8CJUM2Kj4Q6APXNib+1hrpdoRJE0=
X-Received: by 2002:a05:6870:972c:b0:177:a8a8:660 with SMTP id
 n44-20020a056870972c00b00177a8a80660mr446308oaq.9.1679604260328; 
 Thu, 23 Mar 2023 13:44:20 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 vd21-20020a0568708f9500b0017ae1aede32sm6442081oab.46.2023.03.23.13.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 13:44:19 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH v2 0/1] fix dumpdtb crash with ARM machines
Date: Thu, 23 Mar 2023 17:44:13 -0300
Message-Id: <20230323204414.423412-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: OxTLZSvArgEv

Hi,

In this version I fixed a mem leak that was happening if the user inputs
a fdt via '-dtb'. In that case we would assign the updated FDT on top of
the existing board FDT that was already assigned to ms->fdt.

Tested as follows:

$ ./qemu-system-aarch64 -S -M virt -display none -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 2, "major": 7}, "package": "v8.0.0-rc1-37-ge573ef31e7-dirty"}, "capabilities": ["oob"]}}
{"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
{"return": {}}

{"execute": "dumpdtb", "arguments": {"filename": "fdt.dtb"}}
{"return": {}}

^Cqemu-system-aarch64: terminating on signal 2
{"timestamp": {"seconds": 1679603324, "microseconds": 62159}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-signal"}}
$ 


$ ./qemu-system-aarch64 -S -M virt -display none -qmp stdio -dtb fdt.dtb 
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 2, "major": 7}, "package": "v8.0.0-rc1-37-ge573ef31e7-dirty"}, "capabilities": ["oob"]}}
{"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
{"return": {}}

{"execute": "dumpdtb", "arguments": {"filename": "fdt.dtb"}}
{"return": {}}
^Cqemu-system-aarch64: terminating on signal 2
{"timestamp": {"seconds": 1679603344, "microseconds": 145748}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-signal"}}
$ 


First we use 'dumpdtb' to dump the board FDT in fdt.dtb, then we use it as
an argument to '-dtb' and do the test again. This covers both code paths.


Changes from v1:
- g_free(ms->fdt) before load_device_tree()
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05930.html

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org

Daniel Henrique Barboza (1):
  hw/arm: do not free machine->fdt in arm_load_dtb()

 hw/arm/boot.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.39.2

