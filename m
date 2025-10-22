Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93D1CCF9E1
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Oct 2025 12:50:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBYI4-0006MY-2x; Wed, 22 Oct 2025 08:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vBYI2-0006LR-Kf
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 08:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1vBYI0-0001sX-5Q
 for qemu-arm@nongnu.org; Wed, 22 Oct 2025 08:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761137401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=aAilEOob8MMVFEkWURHCW9Vwkf2sd7OjrJ1WBZhbJ5MOrijxW6XleAuN0uUYh39DCDFF6w
 VFGLafRZMzWkZ37yctTzF1dU5+T9XI6+FZG7N5Fg6cQpvKYr+kQfa/3tqOIkpCMr95mT6X
 7n618B45nYcBF5hk8SmrWh2zc5/yd8s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-sT_RuNpJMZy1RgQ-aMazSA-1; Wed, 22 Oct 2025 08:50:00 -0400
X-MC-Unique: sT_RuNpJMZy1RgQ-aMazSA-1
X-Mimecast-MFC-AGG-ID: sT_RuNpJMZy1RgQ-aMazSA_1761137399
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47111dc7bdbso52552165e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Oct 2025 05:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761137399; x=1761742199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=UVIqyFKri06ANqgGvoI2YtDgxxarDGjCvGcL1dQphWHUQACJSeQ7h7bQnF2DK+Tl3E
 +W5Ssa5OOmsSSV6r2MwK37hJCopGDge5SwVkFanpJ3q27M9i/BYdDQLptuQNll8Z7N3K
 iH4p0o/TCXflESu0bET+PQZJo7jx6rsiDkQ3yLTNtu69ma6vxTIhxB0RItJR8laIfO/n
 Kh1UVM8UB/3xAu77mf6uEtKEFVbA4ezrKjauhSmkVz+kx5EZoM0ob5Es1XtBtYTWmdCg
 oWs5VgRbc/OD4Xoq327gZs8H/1gA+ADdRtiKe1VaYloocX/VHB17iUbZwxycjR8EGIso
 JyrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkARTeYRH7RjWPFK+nKHZLZulZP2HkDkZKla44C7VeUz+mHiX2uAWL3c/SPiR2i+RLiqWbif3y8w==@nongnu.org
X-Gm-Message-State: AOJu0YyVz+hq3HwXZogIPOU6a8bGHpdKq6IB3OmlmgFpt2Ls87wJS6UV
 A7aUCvJpvGg6R8W6T2yCeD3LvyturWOyD4t/ufT3leJmuK0T3wDY5amPgamKEWWYEt31YEz/i+8
 r7zudixNKRfY2Pi5EpE7dGEdHp7fxp7P0BSZPJQT4N6bQ6o9xV6jldQ==
X-Gm-Gg: ASbGncvDW8QYXOC8cioxLsKy40UudXtA0xferzZvPv6pP5RVteDGkwNcvHBGCvdHmEu
 7zQa4IzAADxlxKWKktrkeJCxmeww+DFlO/4EBE3yUvBpKcJxa2UWPBAp3WsFooYw40PZw28F6zU
 Ti4KbfMcDOtCi4Hwhmoafj0LQ7TKqPw6evioE3GS+WtUL7T9A1bCpsHsCkbbkDKQpTsUWfSZxWA
 giKIEkMCW14YBOE5lwm32s7Vb3gL0p5jv+8hrksDztUKcjd/34mBLz5wyZ2Y9qU9+zvweqD153J
 YFZP15VORxCouqo9SbMPguG/8Z6fDsJou9k71KsLhyPuuUs2NOWhVpvfpC42EJTsC/zJ6W+r64C
 bR+CPSsh8AN/j+yJdMvcqpEj+YSVfVJ3JVRMUsj++io1a6vGo+ph7ipHZx9cyes2AB+FTt88V7N
 CzNA==
X-Received: by 2002:a05:600c:3e07:b0:468:7a5a:1494 with SMTP id
 5b1f17b1804b1-4711787350dmr122416855e9.1.1761137399206; 
 Wed, 22 Oct 2025 05:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Hm2BY761ErfCQAW9TWE1D63G3DyFVH54t8V55V0H1jT6mBT86okovR2Of93UGrtI6FGtKQ==
X-Received: by 2002:a05:600c:3e07:b0:468:7a5a:1494 with SMTP id
 5b1f17b1804b1-4711787350dmr122416435e9.1.1761137398787; 
 Wed, 22 Oct 2025 05:49:58 -0700 (PDT)
Received: from [192.168.10.48] ([151.61.22.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428a534sm50029055e9.6.2025.10.22.05.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 05:49:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Alberto Garcia <berto@igalia.com>, Thomas Huth <huth@tuxfamily.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Magnus Damm <magnus.damm@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 "Collin L . Walling" <walling@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Corey Minyard <minyard@acm.org>,
 Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michael Rolnik <mrolnik@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Vijai Kumar K <vijai@behindbytes.com>, Samuel Tardieu <sam@rfc1149.net>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Raphael Norwitz <raphael@enfabrica.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "reviewer : vhost-user-scmi" <mzamazal@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Zhang Chen <zhangckid@gmail.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Jason Wang <jasowang@redhat.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 "open list : Sharp SL-5500 Co . . ." <qemu-arm@nongnu.org>,
 "open list : S390 SCLP-backed . . ." <qemu-s390x@nongnu.org>,
 "open list : sPAPR pseries" <qemu-ppc@nongnu.org>,
 "open list : X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list : RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list : virtiofs" <virtio-fs@lists.linux.dev>,
 "open list : Rust-related patc . . ." <qemu-rust@nongnu.org>
Subject: Re: [PATCH v2] char: rename CharBackend->CharFrontend
Date: Wed, 22 Oct 2025 14:49:51 +0200
Message-ID: <20251022124952.3691010-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022074612.1258413-1-marcandre.lureau@redhat.com>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rc229jeEz9OlN6JB1SvQGKb19aeiPSowFUVR6gijCR4_1761137399
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Queued, thanks.

Paolo


