Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp459059lfg;
        Thu, 4 Aug 2022 08:45:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR79CnXCXXx+PcwaOUgpNyYtybEEE5NEoDAzzkoe5q5J1CwugEqG0wOYoLfoPNoz2RBqDFfd
X-Received: by 2002:a05:620a:294e:b0:6a7:750b:abf8 with SMTP id n14-20020a05620a294e00b006a7750babf8mr1787362qkp.513.1659627934845;
        Thu, 04 Aug 2022 08:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659627934; cv=none;
        d=google.com; s=arc-20160816;
        b=0HTZ8E+QlhsEvR4CPpntbqv6+uMfM82gtAV4llgp6XaLyCGowzFcyN3qbR3taAD4Q/
         7LyqSXZEjD9klK2fuoXHb9aV9Fsje7yXXd5uwx+2rwbJ71xuYaP08L1FhoBTyEQ0DRC3
         HXLvYfoUEWRjD52bOMmERG7/VAwQ+oV24dt93kNLTEeiqH0MXDrPxrGvYN6sSOepwYl6
         nSdh1sQhqmAsE7ME/p7JR9F4Vs+3oKcctbZSnV2FZ8NC8FpYYWpYn4dXCSCdjnNi9WdW
         wV0o3niznoaU1x5X1GOmDNOGEWRmhaaAK++4Ox3dCF5JN6TKV4uNSqMD75dCF19y+tgO
         4NLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=s+m8lnletBIZ91Q6d9oN3wlCQeP9F5N9E65I0QdIa5s=;
        b=KyUAmsjzwZ0811ekmFxGzO5hegRsH8X8kNbeD6ES7s0LUWazS7NZCXC/skEkG+jQa9
         LCJ/CTfRb2a4nJiai2FIRwa5J8NJPQXlax27SA4O2zFFf60JSWtemPGnouBye9zFgqQO
         gdzt0Yj2jHIUVJq107IPFAf8/e7Y6C+LojChHicWSWQsZGh8Tua/gViEXeEzdOmTD+dV
         LIK9oyABpN6J2A9XvKAcF88sfrzGUL7g0f1KAyaSJKnrjFR7I/cdKF70f3vOHpHDTgB6
         SKPlxKzFR0Pg+VIp4LC6X6lrBtjVmcsQ0uhAK84unt9vr3TKo7g3SZPQ+dURetNyH3jC
         b7/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hnjnu0fT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey2-20020a0562140b6200b00476687dfaacsi664108qvb.523.2022.08.04.08.45.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Aug 2022 08:45:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hnjnu0fT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oJd2U-00077h-B2
	for alex.bennee@linaro.org; Thu, 04 Aug 2022 11:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJd1k-000751-22
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 11:44:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJd1f-0001qD-MO
 for qemu-arm@nongnu.org; Thu, 04 Aug 2022 11:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659627881;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+m8lnletBIZ91Q6d9oN3wlCQeP9F5N9E65I0QdIa5s=;
 b=Hnjnu0fTEFvSi0nEddeuZjEg4XY9Ckre3tWr2e0z21oaHqzCU7fvSP3QcI81mBqOz0vlHq
 wuJVjcbAJ/jlwhgI49dZNkkYek+fInE16RPVfyvfe5rIkAygOwTgiM1eOOjWJgYs1BUiC+
 Yrt0uUzweAatAarCeBkkIZiUSCd4cXs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-hVQLrb-kPPKswg4N0h_IOw-1; Thu, 04 Aug 2022 11:44:40 -0400
X-MC-Unique: hVQLrb-kPPKswg4N0h_IOw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7666F3804061;
 Thu,  4 Aug 2022 15:44:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07EEB492CA2;
 Thu,  4 Aug 2022 15:44:35 +0000 (UTC)
Date: Thu, 4 Aug 2022 16:44:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, richard.henderson@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org,
 thuth@redhat.com, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
Message-ID: <YuvpYExeQfW2zUd7@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuvY8/WL0Jojv1Uj@redhat.com> <877d3odpm8.fsf@pond.sub.org>
 <YuvjJ7+B61UCLDrK@redhat.com> <87bkt0c9gf.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkt0c9gf.fsf@pond.sub.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6byH5qarVaxP

On Thu, Aug 04, 2022 at 05:30:40PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Aug 04, 2022 at 04:56:15PM +0200, Markus Armbruster wrote:
> >> Daniel P. Berrangé <berrange@redhat.com> writes:
> >> 
> >> > On Thu, Jul 28, 2022 at 10:46:35AM +0100, Peter Maydell wrote:
> >> >> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
> >> >> >
> >> >> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
> >> >> > > An OTP device isn't really a parallel flash, and neither are eFuses.
> >> >> > > More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> >> >> > > other interface types, too.
> >> >> > >
> >> >> > > This patch introduces IF_OTHER.  The patch after next uses it for an
> >> >> > > EEPROM device.
> >> >> > >
> >> >> > > Do we want IF_OTHER?
> >> >> >
> >> >> > What would the semantics even be? Any block device that doesn't pick up
> >> >> > a different category may pick up IF_OTHER backends?
> >> >> >
> >> >> > It certainly feels like a strange interface to ask for "other" disk and
> >> >> > then getting as surprise what this other thing might be. It's
> >> >> > essentially the same as having an explicit '-device other', and I
> >> >> > suppose most people would find that strange.
> >> >> >
> >> >> > > If no, I guess we get to abuse IF_PFLASH some more.
> >> >> > >
> >> >> > > If yes, I guess we should use IF_PFLASH only for actual parallel flash
> >> >> > > memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> >> >> > > be worth the trouble, though.
> >> >> > >
> >> >> > > Thoughts?
> >> >> >
> >> >> > If the existing types aren't good enough (I don't have an opinion on
> >> >> > whether IF_PFLASH is a good match), let's add a new one. But a specific
> >> >> > new one, not just "other".
> >> >> 
> >> >> I think the common thread is "this isn't what anybody actually thinks
> >> >> of as being a 'disk', but we would like to back it with a block device
> >> >> anyway". That can cover a fair range of possibilities...
> >> >
> >> > Given that, do we even want/have to use -drive for this ?    We can use
> >> > -blockdev for the backend and reference that from any -device we want
> >> > to create, and leave -drive out of the picture entirely
> >> 
> >> -drive is our only means to configure onboard devices.
> >> 
> >> We've talked about better means a few times, but no conclusions.  I can
> >> dig up pointers, if you're interested.
> >
> > For onboard pflash with x86, we've just got properties against the
> > machine that we can point to a blockdev.
> 
> True, but the vast majority of onboard block devices doesn't come with
> such properties.  Please see
> 
> Subject: On configuring onboard block devices with -blockdev (was: [PATCH v4 6/7] hw/nvram: Update at24c EEPROM init function in NPCM7xx boards)
> Date: Mon, 15 Nov 2021 16:28:33 +0100
> Message-ID: <875ystigke.fsf_-_@dusky.pond.sub.org>
> https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg03173.html

My take away from your mail there is that in the absence of better ideas
we should at least use machine properties for anything new we do so we
don't make the problem worse than it already is. It feels more useful
than inventing new IF_xxx possibilities for something we think is the
wrong approach already.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

