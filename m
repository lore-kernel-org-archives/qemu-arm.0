Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp527409lfj;
        Wed, 15 Dec 2021 22:51:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx77aWY4az2kdDm0exUO9sp2EPa4zU57K8yiL0JcA6OR6lR92qYfAXbrIx8capWFSYB3/r6
X-Received: by 2002:a25:2d3:: with SMTP id 202mr10931667ybc.111.1639637490010;
        Wed, 15 Dec 2021 22:51:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639637490; cv=none;
        d=google.com; s=arc-20160816;
        b=UVEZUHB1UXMUBt/KYpDh1/of+0LpVvQSFbT1AcvrozE5RlTdOSm+4mb8nd//zkob5b
         e/By2IiywYv00ZDXPYyOSwwbrrJcPSi0SO6YVelMjZPIoSId37iSEGtKSMmhIRhpiT7e
         0R+APz0RDevHbURdJ3Q6tC4KS9DiFTUkllA5tcdwgV8leTgPkNzMChuxAGGs2bD3NQeb
         Uu2Q9yJB3Bqh8s7P5IJ+wlaezJUxRUPpmDj/pdj5re2JlnVQUBDc/VINrRM8Bw7tI/LN
         1MR90JTRJFSDQS1a7JkX7seuksLl3nXcjUew8W91PWmbQS9T9ArFzRrxnwq0VTK3mpgL
         e9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MxuHWfF+qtg+SV+ywBQ12V6ZROfJi/YqNST0MAHC+Ek=;
        b=q2ABCAR1WD2+Zys8A7HHi4f8WkvWJXGtFkb0CqQPmWt+RlTFxo0SA2zaDYcAIXTDHp
         vsz/t384hs8OWOJZyGjUqSqF4FlYTIIHkkVmf2USqvokyJoE0WCZqx/uLGGkjHOQqgnX
         T7jTf24L1NL3Ax/Cepf61BtTNLK1uDYHh4metC0+FilS9hYC0Cf9jdZdp8Ti0pVXF2N/
         OyoF7Xryr+EULrPK84P+XOjPqfDiRj9yp+RP43/BewY8N2PKBWFUwoeG7UH98r/hT50G
         B7EOEvWqF2EvCi0JsJ36gBtXi9xqd4Sar4jCFUWBfANMcXPauNF6/tFHEwxH0PRex1H2
         HMaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=G9a1JuUZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si3769136yba.506.2021.12.15.22.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 22:51:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=G9a1JuUZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxkbw-0008D3-Qv
	for alex.bennee@linaro.org; Thu, 16 Dec 2021 01:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mxkZB-0006LW-RX; Thu, 16 Dec 2021 01:48:37 -0500
Received: from [2607:f8b0:4864:20::132] (port=40539
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bslathi19@gmail.com>)
 id 1mxkZ9-0005PN-Ue; Thu, 16 Dec 2021 01:48:37 -0500
Received: by mail-il1-x132.google.com with SMTP id l5so21325553ilv.7;
 Wed, 15 Dec 2021 22:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxuHWfF+qtg+SV+ywBQ12V6ZROfJi/YqNST0MAHC+Ek=;
 b=G9a1JuUZMLt/n1Z5ZtteS+Tl3TINv2KzVRQK/Vi2gm2y7EwIELBD143LbisMvfJdjs
 rrs1wICXTQGye80Pg6L/LoTp0fnW7tsSSB8fVVMXNTWlKQ8nz4fAmZAmP3Hd03drX4+W
 0ZOLGvS39K/7zChCweRNAF2+QC+dHcE9HwQvLruO7YnUfhKC/2DQEhtLd6SsB944K6ag
 At/iN109eLg1bH+Ldb+ZniNwIINuvzSP8jRbzaMUCuK3bm6lRkwOEAHGZnlwZAntGtuM
 slQE30aPF2K71W2blO7FjS+ISVI8YeqdIgpt16R3nLGkM5h+pboCw7Zhqii/BwH9gvfq
 OSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxuHWfF+qtg+SV+ywBQ12V6ZROfJi/YqNST0MAHC+Ek=;
 b=IbIpdhBSR07hJwEyVlJOvQ1aHz1qk0zsdEoFNr9HMWCB+au/K2MtgQt2zoo9ouKvq4
 25nJ2m+Y29Uq4qakCe00Yir3SB9xd6WUvPXWs9JStwuVYD2XHJWfzbad6harIuony70o
 KYAK9yiKLFqqBCvDNZUo+5di1pgiFCgEWVKEsudSuUNHqR8jSSM/6EUFwSkfr93MP0Fa
 n1uFO77SuWOaxAzlcpEfhSj9mLKaR/pOyXgv/yFxm8PkUSyst/AcKveMI9oq7POtw4SW
 rObbQMSPyskWpJTl0IqbNO+NxCHjmFIwCzEvFJuO8DqdqSWcuAjtozXW4jfdMcGDM2X6
 ZYGA==
X-Gm-Message-State: AOAM530v+ceFKBQrVh5qewnwxuB4DzmWbuwl8LS9HBjltqTGJ6w67rH2
 hj0Qsdo5t6P6fdru/fkp7y5TpEtp13GPgQ==
X-Received: by 2002:a92:c24f:: with SMTP id k15mr8622980ilo.280.1639637313953; 
 Wed, 15 Dec 2021 22:48:33 -0800 (PST)
Received: from localhost.localdomain (s-30-204.flex.volo.net. [76.191.30.204])
 by smtp.gmail.com with ESMTPSA id
 t6sm2081650ioi.51.2021.12.15.22.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 22:48:33 -0800 (PST)
From: Byron Lathi <bslathi19@gmail.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 bslathi19@gmail.org
Subject: [PATCH v2 0/2] Implement Cortex-A5 and add to virt device
Date: Thu, 16 Dec 2021 00:48:18 -0600
Message-Id: <20211216064820.61342-1-bslathi19@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=bslathi19@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Byron Lathi <bslathi19@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jn746bbynagT

Patch 1 adds the Cortex-A5 to the tcg
Patch 2 adds the Cortex-A5 as a supported cpu for the virt machine, and updates the documentation accordingly.

Byron Lathi (2):
  target/arm: Implement Cortex-A5
  hw/arm: Add Cortex-A5 to virt device

 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu_tcg.c     | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

-- 
2.30.2

