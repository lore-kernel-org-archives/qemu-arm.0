Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp633787ejq;
        Thu, 9 Nov 2023 09:28:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE+4DSpIhXoZeUr75PlytBPqXeZRLItmEmxQwm5S8zlaDYDdZDTrXhVmFl/WiWpIN6nYqB
X-Received: by 2002:a05:6512:1243:b0:509:fbf:f235 with SMTP id fb3-20020a056512124300b005090fbff235mr2624330lfb.6.1699550917890;
        Thu, 09 Nov 2023 09:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699550917; cv=none;
        d=google.com; s=arc-20160816;
        b=psoXgoCmxBEzulbRI8F26H8nAjb/CczZB4nGN/rXASFyl40dqi16c9xZkrIONHuwlM
         kIpGr7D7Yumv5bBhBWHViEE6xMG48LYyGIoO5Mx3rWNoK4tIv7TFBbJuucQ7Pr5gp8Nh
         bSLeD7JtpjUg0gN/6VZXSJznZRAwDAHfSCGZCBpB7fx00GZn7/2MNRPMfGbZoOa17RRF
         pqm9SxxtJ9aq8A23ychgb2eYUW785jV+RaKa3xS2d8IaQGbIP+d9F6T1ULLNS0BeVW8v
         3vCH0UxYwZOV73/ZwDSmQyum4V1SwwvhPC6Q4Rjgnxy6UhxL3LH99w5v5wS/nw8U06E6
         xH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RuhH/Qhk/2sg+k7lek2T32YisJ5CbwhJVf7ncXAcHy4=;
        fh=+ZwGweo1eGucUU+lFLIRZtrFKWD4f78k/QYKsVzsKnE=;
        b=mxnBohTeBsJT/ncZRExW+wT3lMBy9iiPhGlhXuCrJQGDV9iiEySoMN4EnO2EhXjIBX
         33bYEhOYenNyROD0NLTcPCqFO/Dp2hDWhdphxcVi+4oDEiDhCjz3Z8Hp9piDtVrGvDEo
         z1TbbjQH6Bp6Vl5RIbOzfsURJeMFVlM4yLyqAISIIM++XetnLA47A+HXQ5/UUFBwtF6R
         mgnIYrJ5/ITEoIcJhUt4pTsDwbx6moth4WJZC5eq+U1BaT+2ioqQAwqQO4jZDch+3AA/
         mQlEXOzEkIbj1CSpp0iG5edYbkf3olKcKpVbDHAP03v1m2J/jIaSDl3m4FlO/B/qk8z+
         AIaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7inRCdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020a5d528d000000b0032f7cfaf2acsi5710030wrv.843.2023.11.09.09.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Nov 2023 09:28:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7inRCdE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r18oY-0004MG-Do; Thu, 09 Nov 2023 12:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r18oW-0004L4-Ts
 for qemu-arm@nongnu.org; Thu, 09 Nov 2023 12:27:32 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r18oT-00012Q-SB
 for qemu-arm@nongnu.org; Thu, 09 Nov 2023 12:27:32 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53e2308198eso1812171a12.1
 for <qemu-arm@nongnu.org>; Thu, 09 Nov 2023 09:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699550848; x=1700155648; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RuhH/Qhk/2sg+k7lek2T32YisJ5CbwhJVf7ncXAcHy4=;
 b=O7inRCdEuhRQdkEuL37h3VmcOiF/wS1EtOqoms1pJo4aqOoJuRP+jMrA5uu3mVFiC1
 tFGuPWSu1OD4uoigT2baMU4vFdEqA7o7mO5vQCWgCt/Qr4MfluXVyu9ot5OHj+AgbAZi
 MbghsD/Djf/ph+hUbspeFMvLNVclo/4fSr9aSxrO2oEG/XhiYDgYtfHxsahgsH/4rdug
 meTi/wJcUmaDBeS4Pb9cth6CEsjB8+VuzLv8E5XQUrIzDPT2Bk803hmalEDP7qjn0xw6
 mRtVZAG9HgGWnQOmgO5T0Va4kOU2EnodjdnwgDCGPXXNjYQw9jkvhDgxHNNUTBWzMsOs
 Ma7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699550848; x=1700155648;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RuhH/Qhk/2sg+k7lek2T32YisJ5CbwhJVf7ncXAcHy4=;
 b=fAv/A2m4iJMlw2brdI4OSBQzopkfA7+wU/ktdeI1as3FOUd7uUjnV9U0PRS3mf49vL
 8/xJMvGhj7Mwt8z4yzhLXpwGvQycMA8uYYWLf2O4hk5SPxk9X4x0Yrp7RNUtQGYu/nPc
 qVMSmzkm0ZN7sjutV9Lu3nt/rP0XOLKO3B4FUOQfcb8m6VwivQF0/5JGuTc5NaD3UiND
 MMyRHBbB1DMBiWFb3TKtfsJmtwqlRt08NsWpNHXYussVocgdOmF5vW4tDEEbDBYZfz4t
 xwz07ZvXTbtFrD8KOj5X+PlcUDmkH668wAZukhRavfql4B5u6luwItJzDWq4pkvq4t02
 y6Lg==
X-Gm-Message-State: AOJu0YwqVxA+JAFqPPcMJ+mwnbrFsfK3K2Opzc395xIQn0aMWqTDuXtv
 nSj+TUdnVjO8MJO+j1aNzXQVkYYxSOfTxjhQbo7Yww==
X-Received: by 2002:a05:6402:1e8e:b0:540:c989:fcdd with SMTP id
 f14-20020a0564021e8e00b00540c989fcddmr5375086edf.11.1699550848137; Thu, 09
 Nov 2023 09:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20231102114054.44360-1-quintela@redhat.com>
 <20231102114054.44360-22-quintela@redhat.com>
 <CAFEAcA_LrLsJ_4PnWLW0cuuTQRP5J7yq48xm8=kLDL39MObn9g@mail.gmail.com>
 <39d99e8d-29ee-431f-82a2-34947f9f4eb5@oracle.com>
In-Reply-To: <39d99e8d-29ee-431f-82a2-34947f9f4eb5@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Nov 2023 17:27:16 +0000
Message-ID: <CAFEAcA8pmJkPe651F9qbFfqiTeeLLxsim-y1yJ2Bc5w6zw6BPw@mail.gmail.com>
Subject: Re: [PULL 21/40] migration: per-mode blockers
To: Steven Sistare <steven.sistare@oracle.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org, 
 Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>, 
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, 
 Corey Minyard <cminyard@mvista.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>, 
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <minyard@acm.org>, John Snow <jsnow@redhat.com>,
 Jeff Cody <codyprime@gmail.com>, 
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Jason Wang <jasowang@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Weil <sw@weilnetz.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ynIZQjAMWG7V

On Thu, 9 Nov 2023 at 17:24, Steven Sistare <steven.sistare@oracle.com> wrote:
>
> On 11/9/2023 12:10 PM, Peter Maydell wrote:
> > On Thu, 2 Nov 2023 at 11:43, Juan Quintela <quintela@redhat.com> wrote:
> >>
> >> From: Steve Sistare <steven.sistare@oracle.com>
> >>
> >> Extend the blocker interface so that a blocker can be registered for
> >> one or more migration modes.  The existing interfaces register a
> >> blocker for all modes, and the new interfaces take a varargs list
> >> of modes.
> >>
> >> Internally, maintain a separate blocker list per mode.  The same Error
> >> object may be added to multiple lists.  When a block is deleted, it is
> >> removed from every list, and the Error is freed.
> >>
> >> No functional change until a new mode is added.
> >
> > Hi; Coverity worries about this code:
> >
> >> -static GSList *migration_blockers;
> >> +static GSList *migration_blockers[MIG_MODE__MAX];
> >>
> >>  static bool migration_object_check(MigrationState *ms, Error **errp);
> >>  static int migration_maybe_pause(MigrationState *s,
> >> @@ -1043,7 +1043,7 @@ static void fill_source_migration_info(MigrationInfo *info)
> >>  {
> >>      MigrationState *s = migrate_get_current();
> >>      int state = qatomic_read(&s->state);
> >> -    GSList *cur_blocker = migration_blockers;
> >> +    GSList *cur_blocker = migration_blockers[migrate_mode()];
> >
> > because it thinks that migrate_mode() might return a value that's
> > too big for the migration_blockers[] array. (CID 1523829, 1523830.)
> >
> > I think Coverity complains mostly because it doesn't understand
> > that the MIG_MODE__MAX in the enum is not a valid enum value
> > that a function returning a MigMode might return. But we can
> > help it out by assert()ing in migrate_mode() that the value
> > we're about to return is definitely a valid mode.
>
> Thanks Peter, I will submit a fix with suggested-by, unless you want to.
> I'll look at all uses of migration_blocker[].
> Would coverity be happier if I also increase the size of the array?

Increasing the array size would also placate Coverity, but I think
in terms of actual bug possibilities the assert() is probably better,
as it would also catch the case of a garbage out-of-range value
getting written into the struct somehow.

thanks
-- PMM
