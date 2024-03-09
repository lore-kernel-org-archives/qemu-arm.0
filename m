Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368132ejc;
        Sat, 9 Mar 2024 11:24:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXNFOKE7862EzC9BDqk5Xq328izDXhWxJesOAEiu+e0ZW7R30x5opjFQ1uerWbIqweeYsvj2pHQOjgW/uo9677IHbZrJgK0
X-Google-Smtp-Source: AGHT+IEI6OHClP0i3inuH0r6pq54EeN24qU5hdRFJWjxeTaofhFCMuwcWcTm8Nzsq/rhynO9xHkO
X-Received: by 2002:a05:6358:724c:b0:17e:6977:7592 with SMTP id i12-20020a056358724c00b0017e69777592mr676667rwa.10.1710012261200;
        Sat, 09 Mar 2024 11:24:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012261; cv=none;
        d=google.com; s=arc-20160816;
        b=mXVaRNhGuRpD6Lim0nF5oFZSxtgnnsMm/FeA6fXk8JkrTap53LcgQolL3gyVncC662
         84/YDY12OrfibJIHv1f4+YCSTOUPBIsLlr5ne0aBjXycqhT2C/xf5TzHaWWU+A6vduly
         /5BV+jIcZ/QkkMKBIqr/Q9vKsHjBM89wCfc8hgFXdiVIu9oCqW8oErH4PnLcFUxBp0zM
         0MfhqfzZtYQtoRXFXs79Ucy6iSI7cMeLJyjSgY3h0pq0clPADAc3Ijc20Stpx5W9boWf
         c2WuUQywEz8K4CvMcuM7V3b1hou43cW+SL7oVDcFNV4ZWZ76MEs95Sn6TKbZIr3qrXfl
         QFIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eUfL1w5ZY8ZGsSxKnH4ewPtSTSCallxtJeVJzhKEKHw=;
        fh=k9ZIoA4U8KPMAqpKFy5mMkULRrZsjP6AjcHsRHKfr2s=;
        b=OJ66HrcRu6KdbxPlJ+PqhuGgVQsCRj0eIJ/zbeAF8mIPC9HFp/ZkJWHEWAezvHvkke
         ApIriN1iFysb6geCGNtYzsgSKElmCed9Cj3D2NidlGCZbaHyOFFRoafZPXjALCwqZldA
         4WmumEBscuqE7BaFKPEJ/HJzPamQzYqv6+PNRiyCvIOj6JC5g+RxyIBpedFxE2SuuDX4
         lFrt3DTboPYdRutI/QwhprTpKwkbabGhVBjPNSADXcQaSDE3Cjmst3mQIcN4LqACfQZp
         yKJhU30p7pVexW2kTA9OaQsvEiXXj79K0tOpUaWO3DgytqECcibTqlxXVpPqtV3/tfpY
         6QWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phxrHw2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a05622a061200b0042f1ff9f462si2137812qta.275.2024.03.09.11.24.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:24:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=phxrHw2B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rj2Id-0002CR-DV; Sat, 09 Mar 2024 14:24:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2Ib-00029X-Lt
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:01 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2IZ-0002gk-Vs
 for qemu-arm@nongnu.org; Sat, 09 Mar 2024 14:24:01 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5684f95cc9bso25873a12.1
 for <qemu-arm@nongnu.org>; Sat, 09 Mar 2024 11:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012238; x=1710617038; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUfL1w5ZY8ZGsSxKnH4ewPtSTSCallxtJeVJzhKEKHw=;
 b=phxrHw2BBwh2uFzWHY3uVG2xMA2LfJche52MECwKCXkFyzZZjOGMreejZ3ItqQxILI
 4THaEuD/VGoiG+UbSgBcvh9t3H/lv3wYUMLlc+Ajg1XZDLt+XZfBHAwOfnPPffIA8fi+
 s8405NdGqj3dF/hnV9qxuGdFKrSPl3FhsNKt6xbeneVHv/ii6yyt137JOC4XjKRcwCP0
 L5d5M4hFiyk4VXWZWLKWzyvpDhKr5D83hnWj0DFzqSL1lUqXy4sDE5fghG+36PKakcq0
 YiQsxsmg7eWHf+m/ihCmBm537rq3f73VRWAAAbZdJ5CX/kJSlXp5pW0KDnpuaKPQNKRl
 oCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012238; x=1710617038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUfL1w5ZY8ZGsSxKnH4ewPtSTSCallxtJeVJzhKEKHw=;
 b=YfpjNTtb28oXfu21Z9nRhgAGLjBj2HbfNsQ44VSDzT+QqgQe+HSOvBejfvUdMkOVY6
 MU/54s4Trxc+sxrtY9Fx1JHM1ruFJF7Hgj1aSE9lOky2d8VaXSdqCbVOEhDyR0qzrz/+
 WhPoK4scQWCPsrKkBP6CbK7eW8YC8sIhStZxFowTywr/OOMOt4+uGbgVndAP7eAmcdC8
 oWO/DwOCO+X99VkN+IApUWZHTqB+5fAug/BaZ5pcs1iydxLx+REshBXJKnR1LKLh8ASU
 aLD4ThW82hoO66zhDIHk7ncnPuT7CFbh5D8Jt34ypj1T7H6tWkyt9vGhbR/FGXAfM1ts
 w+7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFCLaMZsWkKmcUMU+PwZJ8fWlSeq7Z+FMuGZVyf2qPJFwVW82mXWVP7zBa4DztU35ddYRUvlG7dvTJD0K0g+YwB0AX
X-Gm-Message-State: AOJu0Yz+PEfgJRmoyxD8H/8Z85u3iTLiu88jrTk9OV6iV0MZtNN4rRxA
 VEe7RWBKLYxsVU9GyTYctC6Q5ABwMXR1xC5+cxCAA7lrPFD68kcHCAOLTJq2uFU=
X-Received: by 2002:a50:8ad9:0:b0:566:1952:afc4 with SMTP id
 k25-20020a508ad9000000b005661952afc4mr3675368edk.6.1710012238657; 
 Sat, 09 Mar 2024 11:23:58 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 et8-20020a056402378800b00566a4dec01fsm1154716edb.11.2024.03.09.11.23.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 17/43] hw/remote/remote-obj: hw/misc/ivshmem: Fix missing
 ERRP_GUARD() for error_prepend()
Date: Sat,  9 Mar 2024 20:21:44 +0100
Message-ID: <20240309192213.23420-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: jRjHajUI2A3A

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, passing @errp to error_prepend() requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
...
* - It should not be passed to error_prepend(), error_vprepend() or
*   error_append_hint(), because that doesn't work with &error_fatal.
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.

ERRP_GUARD() could avoid the case when @errp is the pointer of
error_fatal, the user can't see this additional information, because
exit() happens in error_setg earlier than information is added [1].

The remote_object_set_fd() passes @errp to error_prepend(), and as a
PropertyInfo.set method, its @errp is so widely sourced that it is
necessary to protect it with ERRP_GUARD().

To avoid the issue like [1] said, add missing ERRP_GUARD() at the
beginning of this function.

[1]: Issue description in the commit message of commit ae7c80a7bd73
     ("error: New macro ERRP_GUARD()").

Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Cc: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240229143914.1977550-4-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/remote/remote-obj.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
index 65b6f7cc86..dc27cc8da1 100644
--- a/hw/remote/remote-obj.c
+++ b/hw/remote/remote-obj.c
@@ -49,6 +49,7 @@ struct RemoteObject {
 
 static void remote_object_set_fd(Object *obj, const char *str, Error **errp)
 {
+    ERRP_GUARD();
     RemoteObject *o = REMOTE_OBJECT(obj);
     int fd = -1;
 
-- 
2.41.0

