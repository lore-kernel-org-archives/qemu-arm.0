Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368097ejc;
        Sat, 9 Mar 2024 11:24:15 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXR6K3St6xjU3C53bM2qpGeBGbpY4d129JjCDWt2e5erhHfF0eLb7VcJBflwlq61Q/wO29EJsHVGJ7OPB1VeQTeR0LbRhLd
X-Google-Smtp-Source: AGHT+IG98l6pvn0rpnK55VRaDD020Ja2mv9khonq2bwyZs+i6gdeWkFdA/DKE0/E/w9H95e81+cg
X-Received: by 2002:a17:902:ab8c:b0:1dd:75c6:faa7 with SMTP id f12-20020a170902ab8c00b001dd75c6faa7mr1899634plr.36.1710012255394;
        Sat, 09 Mar 2024 11:24:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1710012255; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ldw+eIa7NdFSyN4ifG42/lmZBqTERA6Ybi7LbHsozz9muKmiEX2g3EaAcmIYxE4Vm0
         3MNPMlG0UuF1/YO1vfoacRANcZc3nkTkgqfN2TKtUwDH1a+7hfIoZNboQMJGAiT5BeXC
         xrqUVcILA7D0UckUksNlb+6g6rWWrRMOgcuJ01njPkG4hHrTYU8Uj44tegkSvbTSwefD
         RKIY9Wtnl80KW5J6QQSM/IWEeFPgh/oFJfHlkqZI9BymoCD8Y9rg8AzG4cvL59pZ8f7+
         7D4CuifNFZPYXOUhpfJvboI5yQ8o5t/Iej5rygB2Pw4yHV1uwrM4lBGBs73YkWkdWPLE
         YBsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=w5JHLoxMjL6tDi9iKJsLNg13AWr77+ZJm44MiLunTng=;
        fh=Q6b9MGO50pL+K3r13ZZUzlXmEdMQYZsoyBHZEHcfWXU=;
        b=SaA/xcuJEAmu0xTOQoOztY8dJsMucOu+hLsLDbgPaMCaxbmbS3rznEyCwHwdQ+c+J7
         VE3pACQQVJCPX6X1H0hPRwJUOG5brwMIFXLypl7BGuYeAUKqyfqkYKpNB54Jy5dZVlXa
         Kyav3skgYJppt7kV+4cgsIAL1myHq4zAkvZAFQadfzVVbi8UFokRD3d881VOlBJcosEZ
         NgCVTZlHFnNgtx9rKxMadrDgj2FhBpxjzEZyaKAjk32k8uvYRVU9JlrwT262hqGNEsqi
         Bq77nZzkebSKflAMK/pXDaH7L67DLiT5f2NUZY93o+9VNF0OkQ1gu3sUq1HTdYUkju3l
         f98w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQ8o9IAv;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-11455-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-11455-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-11455-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id ju22-20020a170903429600b001db8cd74953si1789036plb.112.2024.03.09.11.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 11:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-11455-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQ8o9IAv;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-11455-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-11455-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46AD4B21302
	for <alex.bennee@linaro.org>; Sat,  9 Mar 2024 19:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB0E4C610;
	Sat,  9 Mar 2024 19:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQ8o9IAv"
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8CF4596D
	for <kvm@vger.kernel.org>; Sat,  9 Mar 2024 19:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710012247; cv=none; b=RJHeWj24+Nv2SNzEGIGEeSsLul9BwZ5cmW5ci/9oOPHotGkIkLALZE4GCMloB/xYeSwI0ESFq1og8IUiq4OGFrAEy4L4qzd5hK8SCNdFixSPnbWjCzY4ds+Q6n59GVpGbRhQRWrR8tpbOQxnkI3Zs+AV/s/LjehsHmF41Fr0Bk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710012247; c=relaxed/simple;
	bh=JtxY7CscfEe4LJt83V4NY01fNf8t8mvsjJ1dvKJY5Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b4MXAA5wE/4I7cMaNfPhvJYsNIzRVx3oR+CpRJ/jX3QLTzQWNaRFKfWyrec6PjgetJQzBSrUotU/d/jZKg1V2isqWDSESz8l4qiFI92n6rWk/y0ZUqjHWnSH40buOPZcCrHWC+N7P11pqsDTe8Bx8ZS8Rwt0MzKz5ZA5Eb+Bd2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQ8o9IAv; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a293f2280c7so503132366b.1
        for <kvm@vger.kernel.org>; Sat, 09 Mar 2024 11:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012244; x=1710617044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5JHLoxMjL6tDi9iKJsLNg13AWr77+ZJm44MiLunTng=;
        b=KQ8o9IAvZiphUZOyXkxRu25OS1EL1XA8FAZ/Qp+tkHsaoFWGm5oJWZ5RH/acDLIiCe
         je3xGs7FEtnhBk3Dv1goJuopvgu/BEIA2JYMLUU/wQqOpaXb7ydoxkJ6qb1i2G+LywgN
         XSJn2ocmXgXduJ4EPhQXtUqdTOfc4PvtO582Hy10eFH+IvkCkTxcbnCc3C/5MEnA+oNw
         XK/W4eqZ++t5HAvsZ72aWZeswqnXvLXY2Z9Sx6J4yy8Musv3I1m2jCfh4Thf5y26EviX
         HBkCDYQsXVAsWOPWbvY8GEIp7BcVUNA4T2EGC9U6M/XpC2PLXuX7Af29GpZWx9LdfyjQ
         KsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012244; x=1710617044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5JHLoxMjL6tDi9iKJsLNg13AWr77+ZJm44MiLunTng=;
        b=PNy/T8g6XGVC/14myns9SxvATz2Sl9N+VMRzP/vnxspDOsnaNZjYFir7tBjdh3J5Gp
         jmDuwtvT+xqnvhTC+sl73YfTfrjiVi51PQBhtyIlkxpuuOzib8cBsQ8YWK9xD/90l6BX
         +S7F4mS0i9360roccddI/lndqC3dUKUvaLHCBuNUhmHKdLImYuV6PkZ4p5KWwdZL9Epz
         Ys8SUYfL9lpxmW30KX7kPdnRoXldd49XhZ2xJFssxpI2g+mly8F9bzo2mh0p1zb1U6x8
         nVLdpBd4XGWM6TlnCzwOkH5VNJJY/s5bqq3ha6Yt5g5yaNNOFrasqBJWW4izLWcu6d1a
         Cw5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAzXP/UFfE2fhdI6VG95tNSvJPwYPD/unM1v8HdHNPdOUt8faSICfsT4dTjKoERTlb/wzoDG7eoKIWjzeXrfMJjCnk
X-Gm-Message-State: AOJu0YyVKiSWsqry9AY3YGovlTI6oQ9JSYgRQqXwbXXNZbc6Bk+Ea3FL
	EQpznu8mGfA+I6CYXtISM0cOCtjeRor1+1B/aAwtybnt5G+cEJbytv7Fe+vyobM=
X-Received: by 2002:a17:906:3984:b0:a44:1f3:e474 with SMTP id h4-20020a170906398400b00a4401f3e474mr1261620eje.23.1710012244545;
        Sat, 09 Mar 2024 11:24:04 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709067c9600b00a45a72fadfcsm1180096ejo.23.2024.03.09.11.24.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 09 Mar 2024 11:24:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org
Subject: [PULL 18/43] target/i386/sev: Fix missing ERRP_GUARD() for error_prepend()
Date: Sat,  9 Mar 2024 20:21:45 +0100
Message-ID: <20240309192213.23420-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lmaeYWprzWAb

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

The sev_inject_launch_secret() passes @errp to error_prepend(), and as
an APIs defined in target/i386/sev.h, it is necessary to protect its
@errp with ERRP_GUARD().

To avoid the issue like [1] said, add missing ERRP_GUARD() at the
beginning of this function.

[1]: Issue description in the commit message of commit ae7c80a7bd73
     ("error: New macro ERRP_GUARD()").

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marcelo Tosatti <mtosatti@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240229143914.1977550-17-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/sev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 173de91afe..72930ff0dc 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -1044,6 +1044,7 @@ sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp)
 int sev_inject_launch_secret(const char *packet_hdr, const char *secret,
                              uint64_t gpa, Error **errp)
 {
+    ERRP_GUARD();
     struct kvm_sev_launch_secret input;
     g_autofree guchar *data = NULL, *hdr = NULL;
     int error, ret = 1;
-- 
2.41.0

