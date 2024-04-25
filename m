Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1277769ejb;
        Thu, 25 Apr 2024 04:02:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWtT1y5ae6HSfVye4DOmBwCztw7QwfI4daVmfPVbB1AXGHp5aKhBjRnFJ2ssuiZUrT5VZgLojfliMYtX2dpQ0a/B8impUKe
X-Google-Smtp-Source: AGHT+IEl4yQ2DVb45Fk4K4ozI+27WXgQaN0DU26drqu3BiKbRzi9zrBTKS1qka6UK/qRiSt91/WN
X-Received: by 2002:a67:b344:0:b0:47c:e2b:69f7 with SMTP id b4-20020a67b344000000b0047c0e2b69f7mr4946310vsm.4.1714042947044;
        Thu, 25 Apr 2024 04:02:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714042947; cv=none;
        d=google.com; s=arc-20160816;
        b=n7CP2AO5KyaS3IA0nYvMjpU9agM6NnvG7jfNGwmb5+a7QIGZKg7HpzBpGs7LYfoTbV
         Av9U827TEs4XbebgyGhG7tNtf9B4BtyHa4rcQcfJ492LOCCjmwCacX9fYKpQZyFnRF9l
         HDs79B7wf0CuGLOgmuQ7hUtLUz7ne+nEiVq2Gz51ebcxSBs0m90VYrfE/LbzqKTd31i5
         GzDMIbiFCK/YTRh80mL+TkbAhfmC6A9KMPr9p6Bp2jc/VLYDusEPVVpnlZU4aCF6ov5n
         zP6b65hZYoAHD80AwxhsQF7QTuCsev+Q4I7BNtp6R+1OVcGj0wfcRfcmb4UdJ+ut3Dbs
         CuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wjoLmpbwfS6wFuFSJimySduX47ZEmh3QOL6abPkvr5o=;
        fh=4wS/KbFuOyq57JXnrZNRpuFxbLnPpaM7vNNEK7NPfx8=;
        b=Mq0G9MNUKxNe2keIWgzEr5+xGp0CZnvE0FeLf/W+jsavKJY2iPzp0OBMVGF0vCPEq5
         sUbMuxVLqt5sDTZLwCdS6GViA5VNMNnFBS+fxpPuNhRPgtCZ1ROB4R2RxM3kzJIVFxwD
         msBrUu/NmvhXmNUIKiQKSoAcjIgfzxC6T8UwGMbao7aTewUW57EWu32GY1ntTS+LD8Oi
         +Y/yydMwMHP3C7bKxBdwch7br12bZOtp83mtjuXq8zIdm6/E95S4ermS1+CudQWQ2Ts5
         sOfhnTrlIDgvZZCorzisR29bhr+PGE5yTnW79PMAFfe9P/ce/mtQEqq+Ewb99jj8j/dJ
         PfrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LiSA7jOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id by10-20020a056102504a00b0047b802a839bsi3164862vsb.809.2024.04.25.04.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 04:02:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LiSA7jOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzwrk-0007kR-TK; Thu, 25 Apr 2024 07:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwrj-0007jc-2a
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:02:11 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzwrg-00088F-Kw
 for qemu-arm@nongnu.org; Thu, 25 Apr 2024 07:02:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-347c197a464so621851f8f.2
 for <qemu-arm@nongnu.org>; Thu, 25 Apr 2024 04:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714042927; x=1714647727; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjoLmpbwfS6wFuFSJimySduX47ZEmh3QOL6abPkvr5o=;
 b=LiSA7jOVkbTokpNSinr3zsFN61oPTSKAuVYvpHfbHxwIk+tJAek43Wlr7awXyBC3/V
 DH5Q8v1rO/VFtXzpKiVCaqtH299eXylf3Xjx+r+EikvMffQg3UGS0ChbbEH52Qxuo6H9
 Qoe+S0gFCgOpxhny2r1+51pgBJOOc0EcpNi1jBcItdH18SLba5xCaalowv+cFYuAflDq
 chgAS5l9hZNOJYVOgOdWF4U3btPV1/1i4FpLeC+LnO3ru8gDZ6FUYKUYKvHcIsNYH6dd
 s8MA1FP5W3zvPN5TOTx6Ff8lg1VRMRzpGkj3//vj7LeTqIWU+zleYuIc9g4FZPGI/0kQ
 NMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714042927; x=1714647727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wjoLmpbwfS6wFuFSJimySduX47ZEmh3QOL6abPkvr5o=;
 b=CO97fIof5THZ4dtaqTuLNWwZFU4Gie/o/eOM3/0AlW8k53EN5fD9/f7SF7ctYE9ilr
 qtGPLYo2Dlo/OAtpsYgW/EZATErW8CVqydgUNTF+ahwhtFMfiE0mXYl1XYvuSurhMX/u
 ZvAWJS+erFIo6fcnox5rlkS23nsCgMa7OJjhjeuougPWWQJwuC5FPJ1It9H7TD4MEEli
 PeHM8uNenEZM36kU8Qk/WCF84Nyn0WgcOylPBYjDxdjiuY9eASnpSbXFrVxwd6sQnfAu
 uUp6GNcJCYyNxypJLaib4eTp6+bXnzcL1z+U4EPoeZBqit7PQ8OQW84IPsenFY6xxTv/
 WyGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqeHCJagdC5dWHwAq6b58Xdu+WAXzHhUaPn5GruXH6Y1TFvTzxWo/hgbfaNHVauGOIkz8Yn9gvLYSyALfVHGPJPx6Y
X-Gm-Message-State: AOJu0Yw71ApO4qeldo0+i8QDx9VfBF1ki5dM5WyIEuceXR9BUuckd83Z
 bhQsxnbS4+DksauEGUy4UzI670NOORUQ1kGidVQk9eR6yzwcMjbDIsLui8G75tQ=
X-Received: by 2002:adf:efcf:0:b0:347:d21:6855 with SMTP id
 i15-20020adfefcf000000b003470d216855mr3965037wrp.14.1714042925092; 
 Thu, 25 Apr 2024 04:02:05 -0700 (PDT)
Received: from localhost.localdomain ([92.88.170.77])
 by smtp.gmail.com with ESMTPSA id
 b16-20020a5d40d0000000b00346406a5c80sm19587104wrq.32.2024.04.25.04.02.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Apr 2024 04:02:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Maksim Davydov <davydov-max@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 01/22] qom: add default value
Date: Thu, 25 Apr 2024 13:01:34 +0200
Message-ID: <20240425110157.20328-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240425110157.20328-1-philmd@linaro.org>
References: <20240425110157.20328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: 3bNfedVH2kGS

From: Maksim Davydov <davydov-max@yandex-team.ru>

qmp_qom_list_properties can print default values if they are available
as qmp_device_list_properties does, because both of them use the
ObjectPropertyInfo structure with default_value field. This can be useful
when working with "not device" types (e.g. memory-backend).

Signed-off-by: Maksim Davydov <davydov-max@yandex-team.ru>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-ID: <20240318213550.155573-2-davydov-max@yandex-team.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qom/qom-qmp-cmds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 7c087299de..e91a235347 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -212,6 +212,7 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
         info->name = g_strdup(prop->name);
         info->type = g_strdup(prop->type);
         info->description = g_strdup(prop->description);
+        info->default_value = qobject_ref(prop->defval);
 
         QAPI_LIST_PREPEND(prop_list, info);
     }
-- 
2.41.0

