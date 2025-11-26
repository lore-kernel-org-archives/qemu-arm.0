Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69159D10F58
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Nov 2025 15:31:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOHTN-0003ax-EH; Wed, 26 Nov 2025 10:30:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vOHTA-0003NJ-L6
 for qemu-arm@nongnu.org; Wed, 26 Nov 2025 10:30:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vOHT8-0001fb-H5
 for qemu-arm@nongnu.org; Wed, 26 Nov 2025 10:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764171008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tKEQaK1u3u25U10idGtC5pOFpjGJv47xe80ze/fml+g=;
 b=aw6qI3iy3fwcpuQYyJzMkcvg2hOKNfPuTztTIf4MGL6PHYPI8ZG7ftcSdMhHJyhTGLbH4R
 zTNv7PnLpujSmW/4JnlSiH+pV+6lSshhD0j2hgVHiwy33DwqQVNPli99mX9c9pNq5BTm9i
 HUHO6RWQY46jJGxGEph9CeWr1zBvJw8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-iUf7zyy3PtK-6a4_3cgt-w-1; Wed, 26 Nov 2025 10:30:06 -0500
X-MC-Unique: iUf7zyy3PtK-6a4_3cgt-w-1
X-Mimecast-MFC-AGG-ID: iUf7zyy3PtK-6a4_3cgt-w_1764171005
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42b3b5ed793so4847977f8f.2
 for <qemu-arm@nongnu.org>; Wed, 26 Nov 2025 07:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764171005; x=1764775805;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tKEQaK1u3u25U10idGtC5pOFpjGJv47xe80ze/fml+g=;
 b=lgv5RsXgo4lwa+rHQ+xpKHOeI5Z4hrrcAz+ishSQofmJdvi5OCENwc7C6g0TuCWeip
 OjtaRA8L7cAHnp4Jw4rNnpjYEssR/NPf8xB+T4SdEPpVkHkFHXd69yuOVRFue+onJXT7
 rmOvLsnZQdR8yngZhkOXiibr8WljrWKXTqb4lsqwYpMdSVtVDQo3wAHreJLrW9n1nsnf
 Ubk/xegnkR4/yLUFQjYxYB/usSQQJk/L1RojGRm0sQmnUhgGRWQB4vKFzgrja0AK1QnA
 NqrfvCbHqCx8FgTjBG7dcom5vnAhXK1BtK6YpC5XArLfXK4exBtVz7dd66yQ5hDFi+iY
 ESSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTcvPUKPMpWuMeCmmBFYkFfMWbNeDX1s7qdqud47in1fTl/u3PdiY31c+3IezpL4VAO8hp0drBJg==@nongnu.org
X-Gm-Message-State: AOJu0Yx7bSLTOHF6UX0CA/wlutHwXbko2R8giO3NjQLXX7Vxzy1QSOQk
 GycXaW43M/OPQknmXzfbJWNcB0PPLMBF0c+zf8pw8dS51YKa6eXhv7FKh86pHQ2sbsIj/KCGqYW
 mSwY9DpltCRVyI75lBBLVadCM/4XwPdQLO3sXgONJrczpzJsoM0Frjw==
X-Gm-Gg: ASbGncvr7HmT3TI5iu3NKPa7QQrOYbnhajneOY5o7tuDLfiJ+5NAFCn7ySd1Io29sNe
 gTLPGjn7HuGtwvWJUbqy59hCaLquIejPsqSUDyLXFO9uAF5ycN8+kEg+Z8LXOlq5DmF8Wz0vlbm
 tbdlDm6ZgQJABVX3CXIlLzUVKr9Bvo9U5f41hw9nNqoKJwyRjlRKxSe1T4awgzKAqlGJOk4+oRb
 XvyRzm2OAF8qld+jLvkusL805yss/FyZhevTVblwGdztxpiyzSe7hIe7Q54fZn5IxJPjmRPC3hx
 I1OExI4BZ3lny/w9IS8AMdiBsscu4ub3X1d6ahtY0OWi9O0ZgEW1sINNUwJK4WNDd33B/PKxcA4
 CtohC3mA44kGS4MV0fPyywTw/MQtLCO4jgAb/VvmauHN82Pl6Z4E2Pz7Xrw==
X-Received: by 2002:a05:600c:4e8e:b0:477:5aaa:57a3 with SMTP id
 5b1f17b1804b1-477c017512dmr188762945e9.2.1764171005457; 
 Wed, 26 Nov 2025 07:30:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7fcDLntXJMnQwckJE3QHcqUII0nGGoPSAPstZVkqJ5gKK0tH2GR7ED0RZBeCksxhukNV89Q==
X-Received: by 2002:a05:600c:4e8e:b0:477:5aaa:57a3 with SMTP id
 5b1f17b1804b1-477c017512dmr188762655e9.2.1764171005057; 
 Wed, 26 Nov 2025 07:30:05 -0800 (PST)
Received: from rh (p200300f6af35a800883b071bf1f3e4b6.dip0.t-ipconnect.de.
 [2003:f6:af35:a800:883b:71b:f1f3:e4b6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790adf0a27sm48584475e9.10.2025.11.26.07.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 07:30:04 -0800 (PST)
Date: Wed, 26 Nov 2025 16:30:03 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, maz@kernel.org, 
 oliver.upton@linux.dev, gshan@redhat.com, ddutile@redhat.com, 
 peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 01/11] hw/arm/virt: Rename arm_virtio_compat into
 arm_virt_compat_defaults
In-Reply-To: <20251125100859.506228-2-eric.auger@redhat.com>
Message-ID: <7bf5729c-ef5b-8925-cbf8-85f21f9cc5ec@redhat.com>
References: <20251125100859.506228-1-eric.auger@redhat.com>
 <20251125100859.506228-2-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MWgig-xOBlswHSyJW_bMrB_OaOZITOypGWoAHGqLLco_1764171005
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.224,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 25 Nov 2025, Eric Auger wrote:
> Renaming arm_virtio_compat into arm_virt_compat_defaults
> makes more obvious that those compats apply to all machine
> types by default, if not overriden for specific ones. This also
> matches the terminology used for pc-q35.
>

s/virtio/virt/


