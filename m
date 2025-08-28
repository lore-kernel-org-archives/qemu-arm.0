Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48321C8303F
	for <qemu-arm@archiver.kernel.org>; Thu, 28 Aug 2025 11:17:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1urabB-0008Le-Jq; Thu, 28 Aug 2025 07:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uraaK-0007Wf-AE
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 07:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uraaH-0006Tm-8e
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 07:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756379660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYu8JU564jljryyvQud9D5awkvjG3aBJFBzP1tkhusc=;
 b=aUOuuqjur0VAcUAJ5VXK5D3QqtCBbfG88NMLWE9SMxCFU85SKJ4dqzare+oWORvcQJx9PE
 uSwFXC5HdW9tYIu9koBlgEDqdiECAFusySKR4/x27UgkZvrovpVVF3i7L+HUGXIZvuJ42D
 YNn/eNs8msO635L5RYLL/k0kCRbq9vU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-NPmW8dR7NHSs6zKBI39jUA-1; Thu, 28 Aug 2025 07:14:13 -0400
X-MC-Unique: NPmW8dR7NHSs6zKBI39jUA-1
X-Mimecast-MFC-AGG-ID: NPmW8dR7NHSs6zKBI39jUA_1756379649
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3ccfd9063a0so285840f8f.0
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 04:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756379649; x=1756984449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XYu8JU564jljryyvQud9D5awkvjG3aBJFBzP1tkhusc=;
 b=Y3SMxO8S/e6VvJ0hy7mVuU8PIabYT/Qmj2DwIF1ELyn81xFGLhHg+ruPCQnuBNiOaZ
 f7V1b0/01r6H+RgkHxRc4h73AtbdFN15ovmwXxb3h3mRmn86AJsKPsobG9OK1Rq2P2dT
 e23xMzvPfVHeOjrPQ10lUO8DkuwFISbAmFj4pd0gEdK8/PVWL64VCFMGygc9t/7RIx6e
 DDG3mNT7ez2z5SzBlCUweR76e1ZmWktbNAjB4UN5PXVDfReULmlsIpUQGe3AUJqiSsBH
 0KhPmQWJPGt2RKvl70Hnu43BVeTHJhTk18/tlJKFH6AaVvOzWS+ZNvR6Ue2Mtwapnrl1
 SXdw==
X-Gm-Message-State: AOJu0YzU67DyzW31ij4bMDQrtLUfu2yA2J/t2VVHPHMJnZKAeHXbYsV1
 Mja077kW9keaB1um/OfHKnoqLHQVAjpVkC6VQMefWAbycj1+c+yq9WqgGmV7SEC7mFDeEw5fy+g
 QFlh+eM1eGsja8oE9gJvMfI0kNMiq8OELQ5O3S9AkyORxiw85kw98OF6OAga3YUNbwFyMDAs32b
 ib/YvTCCE1atDCLAcNNhPtZMxrCRp5
X-Gm-Gg: ASbGnctJsuJNvjStvDKt/XB0b8pRF97AjORYPLx8ME6WWcu6tY2JqDt5ZeAJiUIW5oz
 SYYAAFh7L1G+F6I8BM7aaOXmkTH9TxtZ2WcfwNrXtGsJheXi97Rzl/W0jEVc2UfDlTueJAmCcE+
 P0YsHQdcqyok2OJNNehzk8nZFpzpP8Tu5+KLKlkSMogvojASOFtCW0+5GJeSynbJ1tLLZvdnynl
 SnuZ6ICEL0BJ+0gxzlZxp/1
X-Received: by 2002:a05:6000:40ca:b0:3ce:81d:6c38 with SMTP id
 ffacd0b85a97d-3ce081d6f97mr1794167f8f.29.1756379648892; 
 Thu, 28 Aug 2025 04:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQJsYZOI5RJM8QpY61MuGOK/Kx+TVWNNvGiJpl0gUDsby9Pw2dJRfvMZUWUCqQzQzdgGbnH4zJBrfJgnsfOq4=
X-Received: by 2002:a05:6000:40ca:b0:3ce:81d:6c38 with SMTP id
 ffacd0b85a97d-3ce081d6f97mr1794140f8f.29.1756379648465; Thu, 28 Aug 2025
 04:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250708204806.1898-1-shentey@gmail.com>
 <87c791c8-accb-40de-9ed8-d86bd179dd47@linaro.org>
 <ef55eda3-fc4f-45dc-9f35-6502efeec381@redhat.com>
In-Reply-To: <ef55eda3-fc4f-45dc-9f35-6502efeec381@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 28 Aug 2025 13:13:56 +0200
X-Gm-Features: Ac12FXzlalTmjGtgF_-uO80mPtMvqX6w_qWGsyiXPwctbM0vDzq8FM9oSJrbL8o
Message-ID: <CABgObfYETqXrVNxs=FEg1=O1MAZsQ2Diib7-rL_Wyz+39pnsVA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] DTB build housekeeping
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hyUtBpVKRFNLWVtLtMGI5ERPclI0CF7ddidG7QABYOY_1756379649
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Thu, Aug 14, 2025 at 7:15=E2=80=AFAM Paolo Bonzini <pbonzini@redhat.com>=
 wrote:
> > Being not familiar enough with this meson fu, I'm only queuing the
> > first patch, being a good fix in its own.
>
> I queued the rest for 10.2.

Unfortunately this doesn't work because meson doesn't want to have dtc
from the subproject and libfdt from the system. As a result, I need to
add dtc to the containers, which I did, but then I have failures in
macOS and FreeBSD because they cannot use the libfdt (from
respectively homebrew or ports).

In both cases, dtc and libfdt should be packaged together though. For
macOS, I even downloaded the dtc "bottle" and checked that it has both
dtc and libfdt, but libfdt cannot be found.

So, the "simplest" way to get these patches unstuck is to remove
support for bundled libfdt altogether (and add libfdt to all the CI
environments).

Thanks for your understanding :)

Paolo


