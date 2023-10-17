Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3941976ejc;
        Tue, 17 Oct 2023 07:02:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgI2EW8n4RMrgrzKyJsTh9mwMzgHz/Wceea4IFjYGIu/isgKnkp1HKQoSlcUs6cBjHg8Rv
X-Received: by 2002:a05:6808:2095:b0:3b2:e3d0:862b with SMTP id s21-20020a056808209500b003b2e3d0862bmr346707oiw.57.1697551373032;
        Tue, 17 Oct 2023 07:02:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697551373; cv=none;
        d=google.com; s=arc-20160816;
        b=SxUI6DOf/QRPfMD+vV4zU0ikHl0kUJHDhsUckFzB/k2pqNMuBVKdIVkPQGfD7nStAP
         1u6bUQfdixCbUkO5VBAWyRLBQ3bEbhUe8T2AyVavIg32Wy2Ju5qFVwDCtCd449EmCnQU
         hA3MR/7c1N3E8KkHyH7A19Y72CBPfERO8DDBuomqdr1+5STZw1wN3X5zLDMzsR0QjHnE
         PGTt3CYUrCqTmDeEEKFM2yJ9cfGwqqDcde8lR4mGVKVqoVEug/rq71EsaKiMrJoMTn7N
         ujvCp08e2ih+YPgxFfEURLyehb6oqDGdqvRvUSLTJQHrNrNtjZi17g3MCcCkyxszo2be
         mMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=puWItc3Dt59czgvz0D+TYHTdmTo5qF+fqrS6/T95/pw=;
        fh=PkQUf9c5shm23GEgSgwIjaGjrTFXVTBGToef+bFaIfM=;
        b=aYnS0cthCk05NG0/55C42YS2Wq3tBegZ9lGsmP71KdPVRCdqUmWyN8hkoSVYF+eYQH
         bJ2myMk09JzsPlJG0p+HKuMOJw23JEtSeT1ptsfDAz68DbqHwPpUGrUObznswCwjRc+u
         W1sar2y0rl7wr3AhZqZZbdn4ld650PnbHKnLTWAiQ1TNWEYntqr9zvgYRAlgzVrs6lhG
         qzwx8ktEJAnEUT44mWl0J+0FRSArleofaPCdYg05cU4P669wOQmQ7VAh2Cy/l44f2RB7
         HhqDwW3Drvtd7xED0wZymuD+emSqapLTcgqwbhIzTKaAZVoTOoNaMzPVT8LVUmBcU7MG
         wmmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jr0gTcj/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020ab07191000000b007abaf60c295si151242uao.80.2023.10.17.07.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 07:02:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Jr0gTcj/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qskep-0004PX-RQ; Tue, 17 Oct 2023 10:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsked-0004F3-2n
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:02:40 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qskeZ-0008PQ-Na
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:02:38 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c50906f941so59029891fa.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697551343; x=1698156143; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puWItc3Dt59czgvz0D+TYHTdmTo5qF+fqrS6/T95/pw=;
 b=Jr0gTcj/RCvda45qJVoLxlOfPrQpxeFOoJ2DoUamqij+IWMFPQooAP21YBJEujOIg8
 EnXLDix5/EJ3ZaMyJ9wBXU/5KG0BhejhGQsh5SXnktfDoEsDrwe1Bw65DxUt85QF0an2
 NJPXWsiNffazl3UmUeAaMSierH6+Go/ivvvMKsjYyOWWZ5BHI2M5PHsWfwyNXPbidcmQ
 EDbKvSKuQyc3b2sJBH4CpP498jB09jivLysTpZVwiIIyz4V1jVG9AsWd/YMkFxzSUKvc
 EwqbP12RNOno5pUZh+3ZZP4y4ssv1/haZmbND1QQo7aDCMDwGSdhOdNZdjLaFsHf5Jq2
 JrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697551343; x=1698156143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puWItc3Dt59czgvz0D+TYHTdmTo5qF+fqrS6/T95/pw=;
 b=qmVNSHQpXjTXYJ/gOTJvY6YPkoFtMkgOSwIJ+DGGw2SODULBjIY2AsW0S0X/AKKCZX
 wTHEFffKpox/OBISYJHyHUeFyNuvE9aG8hfs5c6jaEoEpZjw96w///gEZxTiwLOAzoZJ
 Kqsim7KlKCM/XUYuduSCMjEIBLnP2aGjFuL/OIty9m8Aiv6b47md5Ks42YFBY7q9n6Vq
 WWCXAC+IWYI/pwEcav8ZyZpgeWVfgEJ6W85HleyNoyX9Cu3vrKs2IWKfWKFW5c6d810L
 Xlb4BDKd4BN/2gLmtX5jqNCU6CYDC6DD6Cj58J5dgO4tRnqGTmJq4D4U+JB7jnXH3k+6
 mXYw==
X-Gm-Message-State: AOJu0YyqvmpoKunO/fZ+PldeEv1pPQuwFKafrb/AWQWMP6c9qGc3gfGI
 rw4U+89ignpcAjw8yX4C3uOeFQ==
X-Received: by 2002:a2e:5052:0:b0:2bc:f78a:e5e0 with SMTP id
 v18-20020a2e5052000000b002bcf78ae5e0mr1671765ljd.43.1697551343116; 
 Tue, 17 Oct 2023 07:02:23 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c358b00b004075d5664basm10086258wmq.8.2023.10.17.07.02.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Oct 2023 07:02:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/7] hw/scsi/virtio-scsi: Use VIRTIO_SCSI_COMMON() macro
Date: Tue, 17 Oct 2023 16:01:47 +0200
Message-ID: <20231017140150.44995-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017140150.44995-1-philmd@linaro.org>
References: <20231017140150.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
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
X-TUID: WziYePjzQozq

Access QOM parent with the proper QOM VIRTIO_SCSI_COMMON() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/virtio-scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 45b95ea070..fa53f0902c 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -761,7 +761,7 @@ static void virtio_scsi_fail_cmd_req(VirtIOSCSIReq *req)
 
 static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCSIReq *req)
 {
-    VirtIOSCSICommon *vs = &s->parent_obj;
+    VirtIOSCSICommon *vs = VIRTIO_SCSI_COMMON(s);
     SCSIDevice *d;
     int rc;
 
-- 
2.41.0

