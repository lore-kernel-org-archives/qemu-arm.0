Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68704C624DE
	for <qemu-arm@archiver.kernel.org>; Fri,  4 Sep 2026 16:26:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2WjZ-0000Au-Ck; Fri, 04 Sep 2026 12:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2WjY-000085-AT
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 12:25:44 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2WjW-00036y-Kx
 for qemu-arm@nongnu.org; Fri, 04 Sep 2026 12:25:44 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-84faf0fa17eso1191934b3a.2
 for <qemu-arm@nongnu.org>; Fri, 04 Sep 2026 09:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788539141; x=1789143941; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EoggvHQ/cuPoPSyx5k+9q6Wpui3ScOQ6Pt0lTizqruc=;
 b=hxFiJwRHBG08SQoRFU/2O6hTD1I0iggrUyRFi9tOHhIUSyobMNHxk9QWqkVDzANbJC
 G18KlR1TPRGvjn6CEZjoDurvgqb/aEApCOiU11AtUsz5I+RVy6rtZd4iGNLhqJRcQ035
 DXIPPIF01GQuI0z65rL19lmAYMsjB9mAvvSZQX3/0T6RN//AvZGQAM7EDp2eEdIs1vvY
 kQoQ6DeYpMErFIW4epJN/jINztiaEyCHrugF5w1vg8Yy6GoyOhlpusmqCuxeCtBhlC0S
 rsl8G3v/lmcCfViocuGaJD/DF8VgjUE3vnH6uf4Sv9dDetrEwie2vCLOOvUwQdWuPXEF
 yAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788539141; x=1789143941;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=EoggvHQ/cuPoPSyx5k+9q6Wpui3ScOQ6Pt0lTizqruc=;
 b=rPvIg1SkIoqqyjXnK8v553ZiGY1UFBPfvCO3Xcy6Impjs60oSIEULGByi53AzAbVxA
 jfbNVfX+Z0LN73rbQYq4N2zA0Rcz1hJZ4Z+WD7tdhuaj1rML4HP+M+nHo+14/yoCOA+P
 wXeCP44wCPoohH1zljrUcbkAqPyAbOB0N/hIa+C5+jF3mL3gj28dp/gllyggJ6Wnpzy4
 UIg0+hAjw3s+x5MSZ+26zhtzsBGuaTpaKb4rMX7fg1AEBIXvb53J4itG0opAC5bUi4Qs
 +SxPpgoum6X9nZWdlsZW9we1SZPkJdlIluBUP9HwmwrwU0jXrtBJUwS+2YAW4MMUs9s2
 LdpA==
X-Forwarded-Encrypted: i=1;
 AKwUvByDnP0dHroUBFrPHHJsh2URq2CEMZajqjnnB4sL6b3tCOG8PArGSBRCB8pJ223MdX9Kg1gpN9UeEA==@nongnu.org
X-Gm-Message-State: AFuF++nJCR8L9ukSO09C9PapMQzuiaGjLqGSEHqoxIuQ1+unpNzX1NS/
 C6ScpuTgPMloijT2Ap//5XMSRb2CaEv1dezy4ygVPhgqbxP6O4zc2DJKOHebh2XD5H4=
X-Gm-Gg: AYBFou2qzyEJJhnXBQZEyWK8IwbI78TzS+3Q0RFLOJb7v6Qp6YCfqzIfiW7eXPppdyd
 /PIGdZQqQmM0Ha6OApCqgor+GRohPPTD1EeYbd+MGSNNWnN416XsgEFABTVteKuQEX4hmyT0ucJ
 FTw1Msn57iDzBP0uXHnjWR2gbHJaiEEQWCv/bp+rFbjSw530UpoQyY/w1skEeSE1ZR+0wXZMPI5
 67gj0QyuEyBSVLHsHFtTRLaHrqeG4VS8UAx5CKQEtVWMKO+Ewx7Z6Q+UFP9BuALtAXS8MJ5k1M7
 4jl8A/buKM3ab5Q5MjjfMeLa40vxyvm8wdny0kdlmIdge9ZTt/VYX2dQm4yfkvo0iOPa0S8Zanu
 CRa6loCVWlrdZFlKL2iN6f3qynkMpfRsjFtHYmNRLQcrwcQXUDR557koQxDnSEO/JjKiFHbUIG1
 G2AezzX7szknc5MJXUV4r+h5H95ht6V2Dsj0CbkqfBXRcexKpALd3CZmiaWLfv6FhB
X-Received: by 2002:a05:6a00:1c97:b0:857:db2:222c with SMTP id
 d2e1a72fcca58-86168b8719bmr9475111b3a.9.1788539141081; 
 Fri, 04 Sep 2026 09:25:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f95f:75de:b3f0:3bf5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-86152045f74sm1377683b3a.10.2026.09.04.09.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 09:25:40 -0700 (PDT)
Date: Fri, 4 Sep 2026 10:25:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: Re: [RFC v4 07/24] target/arm/kvm: Create scratch Realm VM when
 requested
Message-ID: <aprxAYZzTOS9lPth@p14s>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
 <20260903193611.1058589-8-mathieu.poirier@linaro.org>
 <apo185JSe61bK3zm@FCCLS0092175.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apo185JSe61bK3zm@FCCLS0092175.localdomain>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, Sep 04, 2026 at 12:09:32PM +0900, Kohei Enju wrote:
> On 09/03 13:35, Mathieu Poirier wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > When a Realm is requested, create a scratch Realm VM by setting bit 8
> 
> nit:
> KVM_VM_TYPE_ARM_REALM is no longer defined as 1 << 8, so shouldn't this
> be updated as well?

This changes often - I'll look into it.

> 
> > of the argument given to the KVM_CREATE_VM ioctl().  Bit 7-0 are reserved
> > for the guest PA size.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>

