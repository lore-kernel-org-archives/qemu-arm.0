Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp517773ejs;
        Tue, 9 Jan 2024 09:09:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuU/9SwQE9EAbbdPG+Tcgyqh3lgP0x8YP/JEX6R1rKKq62Kec5RmhJI54+nObKbyOs1Cla
X-Received: by 2002:ac8:584a:0:b0:429:9b97:5475 with SMTP id h10-20020ac8584a000000b004299b975475mr3067134qth.12.1704820149686;
        Tue, 09 Jan 2024 09:09:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704820149; cv=none;
        d=google.com; s=arc-20160816;
        b=KnTa7IBfTqvmqaVm5vxlxA504sex1f2OzZRVbGPxJqiAU1K6+0cdpSTqBQOrCvPHF8
         uzxzQZpV/sgkHBXF0tbNMArcp08La1jEqhkeJeH+yTowbTU1vvCFWqwLR8JUxTe/VHo7
         PSLXmFYaa5CmRCExcUAXYrh0p38hjze/9jBpA9cmhT8y9vQucxBbWxh5Iu5cmpGR3+/U
         uRkYTXzZELIKVbT22jjgA+dzHPskwTsynfkbOCdYkBmbHnW51BeU+b9fxl0edsMdjinB
         ekTuH9yoZvX9KGKJd2aRXnGXbR/dh8fJHpDlZmDypbo9jxgO6QLe7tF605v7/WXsnyrW
         ju8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=69LXYrrfhX4USfUNx0NS+uPG+jTOb5kfwCxIZthBqDw=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=ySfDMcO7QGydJzdu7P2fFPLzP1Yd4tQCe6ThsWdffmybX5o3tnCuvaiWvH8wh4vk+Z
         NFHlA1n+pKdR47eHoduF+UYGNKPVzc4h955T+mOqrTk+V94goH7Bfyzxp2ArJqwI6PvS
         ySSaY/kTKAaecruZp05wREn8gs6QtuxfiUjIjkoDjtAEYFjFsgutoyTuQEB6OY0LNSwp
         YwtE8xM5/yrnTuohpZZhLlw4OuTZiebrnzwbJc8H9UrEQxdoQbICocRczXYi94gY5PQv
         CEeBjs4tFNFbnSJn6hMCxnQCZVtigKPA/2vJG5vrcI23NNEP3AWjpJj+HxSa72uX77D2
         itFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yg548Hlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a05622a030900b0042975d8c326si2385847qtw.728.2024.01.09.09.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jan 2024 09:09:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yg548Hlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rNFb0-0005lE-6v; Tue, 09 Jan 2024 12:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNFaz-0005l0-6a
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 12:08:57 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rNFap-0008Sh-Ox
 for qemu-arm@nongnu.org; Tue, 09 Jan 2024 12:08:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so38195695e9.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jan 2024 09:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704820116; x=1705424916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=69LXYrrfhX4USfUNx0NS+uPG+jTOb5kfwCxIZthBqDw=;
 b=yg548Hlb/8/h1mwmDHQs5tZTWy4re/q2DZkDVgahQY4P+Pn96Juij3/5AE0UVhGDv9
 ZIXjUAB9lqGar2rp81B64vosOmm+fTLXITlcdRcnrWcBIZ57oscQvCN5yjPZQm/QoFwQ
 teutAo1KxVzONutvAOgCSoPZr4AuaRkhMSIfFod7JrhoXEBL89XnDCFFM8NCcbijmsBT
 e+r4hlH3VPCVXKWktjU1E5BJCaSV2dhMDAUJjhsWAsEOyfItk8D2FaPOEeGwpmQ6QAFO
 p54XC/F3QAagHExxKqnXXc5e5P1TQS07mb85r+jFbpSiIFlgleRIq8g91iZBS2JJijbe
 Nl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704820116; x=1705424916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=69LXYrrfhX4USfUNx0NS+uPG+jTOb5kfwCxIZthBqDw=;
 b=i1tORTKYRrsxnjl9wbzBLajq9oJlnNjANWFJhdKBRamDDoIGNy71HNQNHUf0jkgRHJ
 H35tcjrj36LpKRxVjMRTaC12VcbnKKQlSbsJTFNVl1WdbRhxau3Ry/Xco74L02CQFthd
 gCoevKizUMfmCm2c2ZJtRjwZaAb8U6k27arHPI15LuqFqc6wiSzjyUkLYdwZ/zhZm3sb
 xZ/5RFQI28Mpw/AJmK5/rtUcg7ihGqRp7FIN/kgGpaurHqqC9hfPlcTYu87jLB2FEvQl
 6e/7TxesxvxqJ538ndzb8NvD5wx0zQb3NPW19wYXCjz7Eg7B6KknH8tTx6BEONbJAAHU
 YdqQ==
X-Gm-Message-State: AOJu0YxYJZzOv1SgKNrtA3TOHwVdUwZHCYj4Qhwy1PhVphrkFz6FVmDm
 Nrjhv+3cXGgsWHfBmolMe0a7R+HJ/0CKquswECLivPKO6q8=
X-Received: by 2002:a05:600c:2053:b0:40e:4838:f374 with SMTP id
 p19-20020a05600c205300b0040e4838f374mr1073933wmg.78.1704820116129; 
 Tue, 09 Jan 2024 09:08:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c138700b0040d62f97e3csm15328228wmf.10.2024.01.09.09.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 09:08:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] docs/system/arm/virt.rst: Improve 'highmem' option docs
Date: Tue,  9 Jan 2024 17:08:34 +0000
Message-Id: <20240109170834.1387457-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: oXGziXobHu/3

Improve the 'highmem' option docs to note that by default we assume
that a 32-bit kernel on an LPAE-capable CPU has LPAE enabled, and
what the consequences are.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 docs/system/arm/virt.rst | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 7c4c80180c6..c245c52b7ac 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -96,7 +96,13 @@ mte
 highmem
   Set ``on``/``off`` to enable/disable placing devices and RAM in physical
   address space above 32 bits. The default is ``on`` for machine types
-  later than ``virt-2.12``.
+  later than ``virt-2.12`` when the CPU supports an address space
+  bigger than 32 bits (i.e. 64-bit CPUs, and 32-bit CPUs with the
+  Large Physical Address Extension (LPAE) feature). If you want to
+  boot a 32-bit kernel which does not have ``CONFIG_LPAE`` enabled on
+  a CPU type which implements LPAE, you will need to manually set
+  this to ``off``; otherwise some devices, such as the PCI controller,
+  will not be accessible.
 
 compact-highmem
   Set ``on``/``off`` to enable/disable the compact layout for high memory regions.
-- 
2.34.1

