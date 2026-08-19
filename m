Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B289C5DF81
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 14:39:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwhRD-000864-RG; Wed, 19 Aug 2026 10:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wwhRC-00085n-6E
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 10:38:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1wwhRA-00053k-Rh
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 10:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787150320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZI/BZvjn+ShHz0RoXGu6nfIVlieuQa90LkT0U5JUOxM=;
 b=LDEfTt7JxAAVntRTCPSKOo8UFgqdlE1NagySsz+cRHDF36ApRe7dcaZ4F6yI1Pz/lYRAnv
 d7h6wg68jmlZRdA0qCBgqi5d0lEAXFnCFXsq3IdonGnXGDT5OXbKqfeq1gfTZ47qxFVStN
 0eOlMy0iQ5HEYvL2BGaMvJD0LMslaJQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-wwSzoVDJN3mvFi2FAvkr0A-1; Wed,
 19 Aug 2026 10:38:30 -0400
X-MC-Unique: wwSzoVDJN3mvFi2FAvkr0A-1
X-Mimecast-MFC-AGG-ID: wwSzoVDJN3mvFi2FAvkr0A_1787150308
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3878A195604C; Wed, 19 Aug 2026 14:38:28 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 10E401956044; Wed, 19 Aug 2026 14:38:25 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 06/15] hw/acpi/ich9.c: don't pass ICH9LPCPMRegs via
 opaque for ACPI_PM_PROP_GPE0_BLK prop
From: marcandre.lureau@redhat.com
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com, 
 philmd@mailo.com, aurelien@aurel32.net, peter.maydell@linaro.org, 
 pbonzini@redhat.com, richard.henderson@linaro.org, berrange@redhat.com, 
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260819133816.3497033-7-mark.caveayland@nutanix.com>
References: <20260819133816.3497033-1-mark.caveayland@nutanix.com>
 <20260819133816.3497033-7-mark.caveayland@nutanix.com>
Date: Wed, 19 Aug 2026 18:35:57 +0400
Message-Id: <178715015700.1965216.9796601531189833144.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=372;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=wpyITRGKgn+MhTiQZdLCo2+UQLscigwMWLjYLUTIx6g=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqhb9RA/DakguOF/e8BJnqXi2ARD9iS5rWfQ7Hn
 W15BWid1DmJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCaoW/UQAKCRDa6OEJdZac
 5epWEACn0y+8+JwZaWptOExkx704IFs+r29dZ+gDZx2PrrVI7B99FkL9M0BrfZN8uVl2V5MAjf0
 TBt3E6gvUfLMft1Lg+fLuA3O+Xo/YCVwnXymiTvAeRKhHXxn6hCjC6lyDgbf3+PtPDl1EayInsd
 RRFOGuYYw7LMYRkXJQz7OgS/1rOAxiwt0gIb/5lUM7m3QCJZk1ExEIlrfNKqnU+f46Z9qufYsiI
 OsCThRsIoLid3COCOI/k6820Q+8KFR+nltGET9YWypVMKK+kdCuysPCkR+ER0k6Bct21En0vd+a
 15ZgJnoweh0MNmDK0E0lzDUGQRhUHIFOSACM0mStsU6jj8SG7fpsE7zQzaPt/qBhT1BJKwn2Eek
 hsHdq656LOztzNovy/GnYySQHuvJsT3CJMMkp9J3qS+04uBxxydlx14vDLU72RKHR0J2t2/Dz5z
 F1KshNA3QZZ6cbpaMNDx6JkHNmfck2Aotgq77dVorl4Mk8TXRxkCGdXNRa+ANP3YywUmUTTp7r4
 X+gRWpBZzdG7Nl7qjsTzpFfcPRn+VPpi1iW9hiLMM8DI7nCkAq9z2+Ftibk9oYxFPfSwqMfKB/Q
 P4W1tJutDMCkdFGIK/CpUw5mysgQrv6WvrPSzQv2Pz63w+yVaxAv3vd7R++n9nRR5ezEUlLvgzm
 IoJqf5+JfYGkGqA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: rgvLew3Or_CXOGAXrl1Ent_gz5QXQQDaW6VAzmxQxyY_1787150308
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.341,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
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

On Wed, 19 Aug 2026 14:35:45 +0100, Mark Cave-Ayland <mark.caveayland@nutanix.com> wrote:
> In order to convert to a class property, the ICH9LPCPMRegs instance must be
> resolved by the getter/setter instead of being passed directly as an opaque.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


