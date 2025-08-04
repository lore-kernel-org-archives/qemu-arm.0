Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130EEC87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 16:25:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uixyt-0008MZ-TC; Mon, 04 Aug 2025 12:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uiwTK-0005EY-E2
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 10:47:30 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uiwTI-00046R-SM
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 10:47:30 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-71b6703ba32so33952887b3.3
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754318847; x=1754923647; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vnOItkwa0NpGVik8f5+eZnRpbTsAXB3mb4U3hx/tGW4=;
 b=mgMDBvAws2LrbSCOHXSpKXXvJ4L1k04F0Dk2SnUOnuKQKRvS5fAAhzsrYvhTk2E69S
 EjNxmFyAHL7INZ40Mtwdr/BaX40sKCNeyJBoj2ccUYjWHZqBv0c7mk3uu3Zwoyrsb4tx
 FX9gwsddWzvygFnllkiHAzKvdK/M5ATozTBHFD9DWSw9Pw+X5LuBIdt6auqBjkjoLlBc
 gLoS2BAn3b//unP4IKhWoNbDsz3PN8craPt1dcXmaoRA0FTTko2xb9Voe+KfpYq2wWwy
 W/xMfIBExlkPfJoGm1xqhy2j7AT1JWK9/fIcw1fbD+Poqqn4xcFw1es3wKNo2RMryXfq
 0G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754318847; x=1754923647;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vnOItkwa0NpGVik8f5+eZnRpbTsAXB3mb4U3hx/tGW4=;
 b=GSkDe9xKWjBXRXCFxw2W0J4v/oXEZGoePf/1HSL/kNmf8BugObANce0qCVry3//Gle
 O2Hl2uedaiBiTXx8re2D1xMsE2PR6bqnZuTMJcdw9ZZVyIlCBfEcnTnNKWL+GJP7mpEc
 LJE7V4NgECsuW6GY9PqOJgk8E5euTZewL6Xxt28uCEu5MOsNRqSk4/6YFAI0grTPWlaM
 FHrUJMz151hi/jbVYc2ZcOG2bXElkkMB7UgIr5IL5iiMEFvgyjwRZsDMg80GzWxYs2yp
 PUoJ1tkQ0zAcJy0jDDrhaoNn7Y78D/vp+fjR7M7aBFPkT1vRVLq5DhJMvNGhdjEPhmp2
 2EGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW736hsNem8VHH4L/Pr1dBF6xl1ArVIGyVRO5vVXT8j3adAidWsdXEhUQbRz6n9cOxgtjphZeLNRA==@nongnu.org
X-Gm-Message-State: AOJu0YyTJsE9mDQLjbYEXAuwLo/Lch0XOCPkrA5tk/YC7vqD+HPwZfnI
 Ptebszi4TD1mreyrLVVufnOsKaGs9QgTf9A9hbY0h7/wETMdiRw+hwrTSFelnZqO12e9znmfMdR
 8/VnHZqPR5oWJhscx+9Q4IgmapbV7AAZbihmjNwaxnQ==
X-Gm-Gg: ASbGncslDXo7yANYqMrebT4QNu22j3Qgu+0MIqIC58Keli0xU+BXEtFRmGlJWVN+TQ+
 a9Ko+0pDkjmtIxZojVk+OrXPw3TJmL8TdBfVt9a5vUNCL10hsxkjKJFUyJLiTDBQTT1TeLkgqR7
 GPFo/y1XWPeDDXulrJ4V3JRl1/iOHLIY6tsX5pg9alDtoOYKXLE2d9HX31/E4a6csUhNdmqvFh9
 rL7l1Gy
X-Google-Smtp-Source: AGHT+IHGZaIJ/J5S5vmVcEupG0Y7mmsuq4UIDQPeJTV9gJ0vKwwO8MjEBAhKyMOzbj63KEfm0HHLhAW0arh64REJIiQ=
X-Received: by 2002:a05:690c:7010:b0:71a:41e2:b553 with SMTP id
 00721157ae682-71b7f5958fbmr120891627b3.26.1754318847480; Mon, 04 Aug 2025
 07:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <1752689274-233526-1-git-send-email-steven.sistare@oracle.com>
 <CAFEAcA8P4H7n=uXe3qredxVMwB4QtDfZtVyuuTWBLwa6enGR3g@mail.gmail.com>
 <63d52f3e-5d29-45be-986c-3827a5c0cb5c@oracle.com>
In-Reply-To: <63d52f3e-5d29-45be-986c-3827a5c0cb5c@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Aug 2025 15:47:15 +0100
X-Gm-Features: Ac12FXxBGpizn3NDRauqSak9sjOrl2poQlYt6m6UONoha_qzMfWz5ArQIwLoxv0
Message-ID: <CAFEAcA-TsQdFt7S=qyd14gxW095t=Nx2skaxnmxtGUhR9pubtA@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] hw/intc/arm_gicv3_kvm: preserve pending interrupts
 during cpr
To: Steven Sistare <steven.sistare@oracle.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Cedric Le Goater <clg@redhat.com>, Zhenzhong Duan <zhenzhong.duan@intel.com>, 
 Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Mon, 4 Aug 2025 at 15:23, Steven Sistare <steven.sistare@oracle.com> wrote:
>
> Fabiano, could you sanity check this patch? Thanks!
>
> Peter, more below:
>
> On 7/21/2025 6:24 AM, Peter Maydell wrote:
> >> @@ -883,13 +895,17 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
> >>                                  GICD_CTLR)) {
> >>           error_setg(&s->migration_blocker, "This operating system kernel does "
> >>                                             "not support vGICv3 migration");
> >> -        if (migrate_add_blocker(&s->migration_blocker, errp) < 0) {
> >> +        if (migrate_add_blocker_modes(&s->migration_blocker, MIG_MODE_NORMAL,
> >> +                                      MIG_MODE_CPR_TRANSFER, errp) < 0) {
> >
> > Why did you change this? It's the general "if no support, can't
> > migrate at all" check, which seems unrelated to cpr-transfer.
>
> "If no support", then cpr-transfer should also be blocked.

But migrate_add_blocker() is a wrapper for
migrate_add_blocker_modes(..., MIG_MODE_ALL). So doesn't
this change go from "block migration for normal, and cpr-transfer,
and everything else" to "block migration for normal and
cpr-transfer but let the rest through"?

That doesn't seem like the right thing; if it *is* the right
thing then it should be a separate patch with a commit message
that explains why we do it; and we would probably want to
audit all the other uses of plain migrate_add_blocker() and/or
change that function's name or API...

thanks
-- PMM

