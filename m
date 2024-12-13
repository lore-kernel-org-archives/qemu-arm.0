Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp450848njb;
        Fri, 13 Dec 2024 05:49:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCof4Nwfvbj1ipWHRjEkMT6LwuAjDLqMtKnX+TIppXK5iA0pia1GMjvdLluBxTfdFT/5ipNRobNJVw1w==@linaro.org
X-Google-Smtp-Source: AGHT+IEXb+56THoqDXAF8Ruj4h72j/vs5lkymHFlKJZQw2mM1ez//trc5s6P3Lo7SRWp7EMPRj7y
X-Received: by 2002:a05:622a:1181:b0:467:8734:9944 with SMTP id d75a77b69052e-467a57102c0mr49252531cf.5.1734097751348;
        Fri, 13 Dec 2024 05:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734097751; cv=none;
        d=google.com; s=arc-20240605;
        b=FOkH74M0ll1X780QPjB/0xjkCkvzm0V8E6ZqtKhDnDL68cYNyVd2UKbQjFtBXLStwz
         d496XmRsiKDkW8ANvgBILA+imZtPOIz8//YETxfrHGHSRfXWma1zqWvhvDlQHYIp67TL
         u4B+QVenRBbSqevPCaJ9h984QlIT7wS4vNHcyHtURm5tT3yXtOHC4jq3b28Hfc9mFQr+
         mKmjqY9g6HwP2Q9xMXb2E0Ws9Zg0PnetNFvZUOonPc79bpBG/dnoIbDkwVescWnL3Ijp
         n+HIZvGxjW9hLqpsTZlE6blnV6sXM83aTW0DxdF+QEL/36MUFsIqunRravNsjAorPZ+o
         glGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=eUdDt754fmRm+ajHtzyhBXG7s4DzLn+EIDG0VUvPiYI=;
        fh=8K9UZ6PRzwLFXy/TiuOmWAng+Ot46AJ76JtfixCX4AA=;
        b=Ssz1XRs7RGo5/N6ZhwydGkoQEGSAaCOef8dDqO3fpFakjjjOIoTbxn+zegCRekwQ+W
         BmSF4ppiWhrTahi2ddzBGcSGuvHdr3tTWzHNbFnQZ62x8BClpRzGopegSKLseDtdGS1Z
         pZDgd596248m6BG23SqHSKr+GhrbR7/olcfIbz/QeqVlv2WVNALkdZ+VqRXj2C5DQghP
         pnyIJfTHUyjV4kGPOO51e1Mumg1GhbepRffAeUltN0aSWT3WemdW4XlcLj9e7n4xUnti
         b12ivPY992a87/iHuKqB8xe9O+pJq5vMysHCfYzEQdXNF6/IhQhLtW+cq5rAV8zP01Sk
         Z89Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=haUaH6ma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4678c7ac176si65618471cf.406.2024.12.13.05.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 05:49:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=haUaH6ma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM62B-0005ov-Dn; Fri, 13 Dec 2024 08:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tM622-0005n5-4U
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tM620-0003s1-A2
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734097714;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eUdDt754fmRm+ajHtzyhBXG7s4DzLn+EIDG0VUvPiYI=;
 b=haUaH6makgE279Q5HJKUVLMGphZzIfovqgfD1tRtfwXDoAYarfwKDToRMz9T4P7SpT5/eY
 xecfe1FkQaeqv+GeU4rFs7Z9uOUWqvvAajqeOEVyrq5nQzFgFFz64RpB0ASIOPpx8kV1E5
 s05Au7i3CKs/1XzwCosjFpb9RM9Ff2A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677-h-ByRnSVOpaFaFPTEA8NeA-1; Fri,
 13 Dec 2024 08:48:31 -0500
X-MC-Unique: h-ByRnSVOpaFaFPTEA8NeA-1
X-Mimecast-MFC-AGG-ID: h-ByRnSVOpaFaFPTEA8NeA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A6A16195609E; Fri, 13 Dec 2024 13:48:30 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AA560195605A; Fri, 13 Dec 2024 13:48:28 +0000 (UTC)
Date: Fri, 13 Dec 2024 13:48:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 4/7] hw/pci: Have PCI_BUS implement
 TYPE_FW_CFG_DATA_GENERATOR_INTERFACE
Message-ID: <Z1w7KZpC9X6ypLdY@redhat.com>
References: <20241213133352.10915-1-philmd@linaro.org>
 <20241213133352.10915-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213133352.10915-5-philmd@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IvpRqAYsBzlu

On Fri, Dec 13, 2024 at 02:33:49PM +0100, Philippe Mathieu-Daudé wrote:
> The FW_CFG_DATA_GENERATOR interface allows any object to
> produce a blob of data consumable by the fw_cfg device.
> Implement that for PCI bus objects.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/pci/pci.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

