Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAF8112584E
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Mar 2026 16:12:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0M6r-0006On-NK; Wed, 11 Mar 2026 12:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1w0M6l-0006Dh-FQ
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 12:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1w0M6j-00073d-Qp
 for qemu-arm@nongnu.org; Wed, 11 Mar 2026 12:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773245305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=DNq8UD5wetU5Im0FhISGtnkyyFy0SRjo7GmmsaMOHCmc6cXSLnTqz6PCrtC4zardubZqum
 K4de4oQBuUGKryNZU78ILZC9COqZY2DuGpniTcEsY2y7cuNduwnpDMTEmnij25wGoK2lgp
 RI8EMfJl6enrFeozHL05SRx8AnsADrs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-wM1pi8qeMyiSW1P1ZoGURg-1; Wed, 11 Mar 2026 12:08:24 -0400
X-MC-Unique: wM1pi8qeMyiSW1P1ZoGURg-1
X-Mimecast-MFC-AGG-ID: wM1pi8qeMyiSW1P1ZoGURg_1773245303
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439ae28f5fcso23050f8f.2
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2026 09:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773245303; x=1773850103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
 b=F2Ly747sFZDQpsOWh/qkUPzcGLWS6x6Urn7II5yHbe5iY0Sqb0h0GuAYExy6KG7QZZ
 xRpUT5uiJOzanBqhK81k3yUxpTMrXMAgyMzuq1k94Y2h0pGdGbkF0ZUp6ozTNkkN6Ugz
 ir2Cyn777/R6MtHoYRzZhcN6PECK4TpSwXhJrHkEI+Mj3TH+1NIvAHo9tdE3K2Vw/lUh
 ePfCDwgxXAlTjbgNJQihjAwg9wu5u4aRxUIVtm2HwLUoxzOo4le4sPv179SKJJQtIdRk
 yteymLqXRn59vxkP+NGaxN2H9N/BQCggZgR1MNaRk+ZgAE4s8xnTZS2xW54E0vn0pNAi
 Db7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbb4/A6r4enb/8P47PD3sShRgvBFxZxTR7NS+tzfqP3KYeFdl74W0DW90DqK8UH3eYku0be/jPqA==@nongnu.org
X-Gm-Message-State: AOJu0YyoHFRTIfKtKW3Dzl5sZNeGgTkW1o0lfR0VrV5D0DJyXr2TxX30
 8dXCj7KDXpR1a1M34XycjmnVq7y6lF4LnXUIDHpGfwi+GcbZYcmSUlF2y9M+La7sRrjeoLQ+j8t
 2wXuE/IJigiQwZfgMrDloKk8FmmjV7jvxOb3a8sFyJ+TWeCezbMmh2g==
X-Gm-Gg: ATEYQzwo3QAe7HxFnzgpJv6P//2QGXXpEHWP123y4lRwQXdB3lEgxtzMS8WerRm33Eu
 n+OfFRy1WpwSHqulQH8t7H05mHi5uXynebNsd/48aP+K/zuP6ILpWsQSNrp8oDxUKrjyxi27jV2
 3dCpZc40xQl3QJ8eOojpznoudwG+YaxTSIj2reCQBs66ezV9xBbmh7VJLgIFSvlDEsbwFanPfW8
 Y1sShUFAj2ZMFbRqyCOghTXknYvX/Nku8Z3EoAYsiEJ+EUXVI0MJA8wvfZxMBydKXYDbuaILsTq
 sIFm1Syu/7Ji6ReI1xqSNZl/5c1B1RyJznxr+89hd+K28BmOW0Im9IAxTm9KXTOpvjkbejz6Oos
 yoDPF/VldP+ge6K9YDGqHP6uIZF6JpRlqhLqjfMI5s/DTU9o9mOnFNWpPCKScft5SO0eh5wH31X
 EgrcvbXxupGp+t51kXDxxKynmzj2Y=
X-Received: by 2002:a05:6000:26c9:b0:439:b59e:5e6a with SMTP id
 ffacd0b85a97d-439f8204ad6mr6007654f8f.14.1773245302749; 
 Wed, 11 Mar 2026 09:08:22 -0700 (PDT)
X-Received: by 2002:a05:6000:26c9:b0:439:b59e:5e6a with SMTP id
 ffacd0b85a97d-439f8204ad6mr6007585f8f.14.1773245302219; 
 Wed, 11 Mar 2026 09:08:22 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.144.138])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe19aec5sm232987f8f.4.2026.03.11.09.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 09:08:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Alyssa Ross <hi@alyssa.is>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Eric Auger <eric.auger@redhat.com>, Miguel Luis <miguel.luis@oracle.com>
Subject: Re: [PATCH] target/arm/kvm: fall back if nested unsupported
Date: Wed, 11 Mar 2026 17:08:19 +0100
Message-ID: <20260311160819.555999-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311095405.26297-1-hi@alyssa.is>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GWtSJeGqDHb0eSFSxgMCxmATwYh6WZOUWVmeIWzVEGc_1773245303
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
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

Queued, thanks.

Paolo


