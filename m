Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp4587458dlj;
        Fri, 17 Jan 2025 11:11:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVcLUtVAkWEJaVt5BaYbFQNF5onMJ8IKsp9vovp81N5SwcXxDmwCYs0uWI160ekIgMrAn9dXKIoxiMThg==@linaro.org
X-Google-Smtp-Source: AGHT+IFoFRTjkHsvkOlL58nf7YRlGocp1gC1y2oY09L2r9dXtb8N6XUSXm1r1f2Piucol22TIgB1
X-Received: by 2002:a05:620a:2496:b0:7bc:dc89:3703 with SMTP id af79cd13be357-7be6323b5b3mr681759785a.14.1737141095346;
        Fri, 17 Jan 2025 11:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737141095; cv=none;
        d=google.com; s=arc-20240605;
        b=i3eCsf5w13G4hZnvueweRPK8bXE6gpkY/CwCXfNCVXnTM0NjXye4SI9hBq3NTq/xwf
         Zsjp+Wl8oIq/CqFnact0PXcRXYHDPmK+QjQkybMcWrTnJ5cXM9CzwptTmExYbS0B77/e
         FlHa1HnGVyX3GEwxy31BQdJd37MzKQoZf7NZaXN3ZFqvo7HHv63Dcpum7MxBEbC3kQxp
         3yzaeuxoPz46F5bjNYfMcGEmKE/yuFBkrn+4VZsMFJHqKgsndGjRaQbegypYr2HgKg10
         9tFlpc/BQOYISu5nI4SoFVGf55q9DjAEiKC9WMRD6zt3dIKvvF6Dr2knfYPJcyl08lp3
         qWBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=iBN5MF1OZ0xSnbJzfoC4m/ue93omhoyKBU+oplZTk4A=;
        fh=0qJRPn8Aec9dj24glFx670jIO/zAUcNru1RYgkIoYpw=;
        b=ESQn6tsjBDYDGx1W4AwCbUja8jj9/4sQJ4CYCxNNjADhvcJIb9dwyipFuxsD+qs1Eo
         3GngpjgKWeJ96XloOCo5ncqE8VcZ546x++h7E1Tw2H0GzB9tTcec6nPoAZgGD1GbORp+
         UKcIbDmvcR86WxzlDys45I23RZ4y3KdBYpy8xosWaabdLWtoVZ/OXhYnuf8x97Hjx4AI
         H3BsncCJAV+dad0M9+8ZardN56f0HXeFvunKXmCUOf/k4FpzwzSXj3jGLdotA/EL84rT
         R/C3cfSeKkhnkmrGbvlcGzTxNYM+FImwGFAZc3TLm2SsypwmcsmTQ4AEopTnj7Z615t/
         C5Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A7UREMkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be6146c902si341899285a.112.2025.01.17.11.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2025 11:11:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A7UREMkn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYrka-0005OW-SU; Fri, 17 Jan 2025 14:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1tYrkX-0005N3-FZ
 for qemu-arm@nongnu.org; Fri, 17 Jan 2025 14:11:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1tYrkU-0006fU-L1
 for qemu-arm@nongnu.org; Fri, 17 Jan 2025 14:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737141076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iBN5MF1OZ0xSnbJzfoC4m/ue93omhoyKBU+oplZTk4A=;
 b=A7UREMknqYQURnoFa+gAGfRCC0Nu9cv90LBP8fpXFPkahtjeAWA3WoRFup92ygDUWBXt3j
 W9ncLsGZ24NphVHMDrb3vwQOH+qTr6iA4dZDN8WHqMdQyPDyqY5kTy6adPu6rpLtAq+TXu
 wdieO9FfeYW3dlMZT9j+Yro58vjIhnQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-AtqIfRFVMNS_bdIA5qkLyQ-1; Fri,
 17 Jan 2025 14:11:12 -0500
X-MC-Unique: AtqIfRFVMNS_bdIA5qkLyQ-1
X-Mimecast-MFC-AGG-ID: AtqIfRFVMNS_bdIA5qkLyQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 15E231955DE2; Fri, 17 Jan 2025 19:11:11 +0000 (UTC)
Received: from gezellig.redhat.com (unknown [10.39.192.203])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 49D7F19560BF; Fri, 17 Jan 2025 19:11:07 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, maz@kernel.org, sebott@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH 0/2] docs: A couple of small changes to system/arm/cpu-features
Date: Fri, 17 Jan 2025 20:11:04 +0100
Message-ID: <20250117191106.322363-1-kchamart@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.79,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rfs0GlCWuthZ

One is a trivial, mechanical change to consistenlty use "vCPU".  The
other updates some details about the "PAuth" (Pointer Authentication)
feature.

I replaced the "TCG vCPU Features" heading with "PAuth" because of this:
before this change, the section says, it is about "CPU features that are
specific to TCG".  But it has only PAuth-related parameters under it.
Since PAuth is relevant to both KVM and TCG, I moved them under a
separate PAuth section, instead of duplicating it.

But now we have a small inconsistency - there's a KVM-only CPU features
section, but no TCG-only section.  I thought when there are more
TCG-only CPU features, that section can be added back in.  Or I can add
that back in, if anyone feels strongly about it.

Kashyap Chamarthy (2):
  docs/cpu-features: Consistently use vCPU instead of VCPU
  docs/cpu-features: Update "PAuth" (Pointer Authentication) details

 docs/system/arm/cpu-features.rst | 37 ++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 11 deletions(-)

-- 
2.48.1

