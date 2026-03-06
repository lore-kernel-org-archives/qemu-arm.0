Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731BFF01826
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 11:15:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyT9L-0002Lz-Fa; Fri, 06 Mar 2026 06:15:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vyT9J-0002Kj-Hm
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:15:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vyT9I-0006xh-0y
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772795713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZhNksprdYhJsFBJGHpehsA641Ev1DzrhMR/qi8A+aY=;
 b=QWxnBMcqne8GLNR9MROCLJNmfe0SeOYZgJAalu8GDrPU2CG+jOoSh/Hr4EZzAgp/4/c2bO
 e0bvtXyCYCJrUSvK4XkfmYIftWb3rrk10J8+rCF4W4fkbwbDLRE1NobgZUfDIAK7Hvdio9
 viAgiGMjZBQj22uzEemtAE1GZqRQ/Lk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-A-Erg9t-PcGELsIgjnEc6g-1; Fri, 06 Mar 2026 06:15:12 -0500
X-MC-Unique: A-Erg9t-PcGELsIgjnEc6g-1
X-Mimecast-MFC-AGG-ID: A-Erg9t-PcGELsIgjnEc6g_1772795711
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-439b9116e2eso3287968f8f.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 03:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772795711; x=1773400511;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EZhNksprdYhJsFBJGHpehsA641Ev1DzrhMR/qi8A+aY=;
 b=b48PlL0oW/+QMYrRAMkOi8uW/euQUOfnWAUDVAMNzUoNX4Au6nFcYWnt0nQHIyh7cV
 qtgXMSqPTo6by+LUj8by0QILa7+oiEgMl40g1/uQXYmL8JdSEvOZDxnlCiEU2kBlq+b/
 Ck757u48RxlISg2FWOvDtH6b4lpt9I1Bn2GanTsyc1AF0U5TBEgbWIbJNNUhuaEdXVUF
 GrWcrBG4FBYxDSft9Dh/GgT4uRJYea2MxEGUqDYpdwK4UEBMxr4PR5J8Q/JwiidPOx9U
 +zSX4NHlssnbPNq7Ty4/APxQo9jLuJ+3apOPcybFbKMzeyAoz4T8UXjAqC/ESRJSqGZq
 QRfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbw50iJP4pdFSU5A+e750f7jGUWw0X7o7EK0J80d42FysJZyGs5m06kXGUp+KZPPoC5CgB+WoF2g==@nongnu.org
X-Gm-Message-State: AOJu0YzsVzt1XjE3wlhAwXxqDW/KzUjARhnOUsriM3jcdIaELizJQkGP
 WL0xeZqlPfTiysLG80BknQg8S/rvMnVS/sqbcMgQLYYVOAQQhRzPdzE8bEc10RAs7wq2zX6IPCr
 cWDIQh3DrJvIXV0Zw+/svhPdruk72Zd9/XM//xt+FaVRQ70ppH7WCpw==
X-Gm-Gg: ATEYQzwZNVDFOyTB8S58nlEoJrOQn/hCKUG9eSPk4kI1dpvevaqmd+Ta2wElafcT7TL
 gMl7/KWmRRj3BWcrHkUvmXWlH/jRBuwdH52QJpAys0KUzuDbHJTkOjadMRHLor+a2Z3lwUy9o3l
 TClDt4FRllIz/yAM9ffuqY3eAW3RjE8vecDTheSUFU8krYhpdQKx3ZKwq71+S68bVvAlBWiRkmw
 n302wiZRJEmat1KDx3v48yjphzMVdmrz++xXxUQdHxwoiSGo/lrf/0vwmqBSeYBE1icjFHhcUJ3
 MMDL+Bn3C6yKUh19PPLK3h4oIHMMkW+mcJU03DQORHhG1E7PeMnZ+IXl6pz26pAgclP7mKs72ON
 WXBIk/jp2A6iJhjSCRQwqNlZX1LyTh9wbWe040KmlPAQUGUczldIYEkBoKn8bNjURxBvJ
X-Received: by 2002:a5d:64c9:0:b0:439:cee7:714f with SMTP id
 ffacd0b85a97d-439da86f5afmr2779341f8f.53.1772795711082; 
 Fri, 06 Mar 2026 03:15:11 -0800 (PST)
X-Received: by 2002:a5d:64c9:0:b0:439:cee7:714f with SMTP id
 ffacd0b85a97d-439da86f5afmr2779286f8f.53.1772795710612; 
 Fri, 06 Mar 2026 03:15:10 -0800 (PST)
Received: from rh (p200300f6af4a490003d6f56739ca055c.dip0.t-ipconnect.de.
 [2003:f6:af4a:4900:3d6:f567:39ca:55c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae483desm2884818f8f.34.2026.03.06.03.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 03:15:10 -0800 (PST)
Date: Fri, 6 Mar 2026 12:15:09 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, peterx@redhat.com, 
 philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v8 5/6] target/arm/helper: Define cpreg migration tolerance
 for DGBDTR_EL0
In-Reply-To: <20260304102249.1963784-6-eric.auger@redhat.com>
Message-ID: <ec81a766-8a0c-48e1-be74-fdd4cdf90f66@redhat.com>
References: <20260304102249.1963784-1-eric.auger@redhat.com>
 <20260304102249.1963784-6-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M43zpA_L_3hahKSUeGmWAaBKt5n46JNl9wjhqXgNkUA_1772795711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.892, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.622,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, 4 Mar 2026, Eric Auger wrote:
> We want to remove AArch32 DBGDTRTX which was erroneously exposed.
> This was attempted by 655659a74a36b ("target/arm: Correct encoding
> of Debug Communications Channel registers") but it was discovered
> that the removal of this debug register broke forward migration on
> TCG. Now we have the cpreg migration tolerance infrastructure, we
> can declare one for the DBGDTRTX. This allow to revert the reinstate
> patch.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


