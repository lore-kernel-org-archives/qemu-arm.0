Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2669545ejb;
        Wed, 4 Oct 2023 06:54:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsdq8xuxy0KZ8gPigD8JBrCqNpF0n/PabD9VGlGoB/d/GC6LVsACv5e3jMP4oYKSZJn+ap
X-Received: by 2002:a0c:ec47:0:b0:65b:17e9:1c9d with SMTP id n7-20020a0cec47000000b0065b17e91c9dmr2262200qvq.52.1696427681690;
        Wed, 04 Oct 2023 06:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696427681; cv=none;
        d=google.com; s=arc-20160816;
        b=FT/iAeQe9PiCgIs9AWzIitoY45KtPpZYsAEjRudhOFPCqZQbODJu6gZE3jRnoVTXEL
         +nFbJzw9PKZYo7sWOviQfXW6Mk+k6yzf3w3+ru989hBpEow9Y3Y/Bs0gTf3bu2s6W9DC
         m9b6L5Q2qWMawQ/xz9WFy17yVw/pmdIZNXL4M+EKBwoXVX0nNRqzb+CYCnE76kwfXL8d
         834ItVj9s/Iy/XVg9zssVTGKbHeqgqg3S4ZN5SGYOC+SN/OYd8zs15AAbjQLeLe4uGzx
         3bRjsvrHeL98Jpk6IrOtNnQEluCFREx0EHG7o0NAkSTVbbqG65vBS/BLnWVf5nVS/ZOH
         SZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=0dfRZbA01YJUiuxNKBFFhz/y+zEEaB2FKPcBYc0j6bA=;
        fh=ElE+gicYeJWiiJq+ohJID/xqUxRAdcD01Rl7gOYdqR0=;
        b=dqwtcsRGVp3gWPF/L7gQBR2wo+lIz3zm9SqEProC9wVvB5LrmskNEsPGK4/JrveuWZ
         pNXkw8hTdqJPE1G55wY7cY2W2KFnrIE0Hxgut6yTm8kU6IQCIZE7R6ZWQKCB47bxJTvw
         mCUKIgrF78PuRtzeJk4ztQm/YFxU2NVGsm/E8pCVa08NstExieVmAMt3NJzv5gey0BHx
         UDFJIKsSOZ4JKLUso6zNktm9IoQTDaffdOk897uNnaOz8c+6AXPxUW/1yW70AdQ7G4y8
         7xjGfWhzLytlghIu61xHHi7XgyC64iQ0ZpZxORlVCzMIWCynoW0zmI28CU4FIMj/W/ee
         SGcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dpXLHvzu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6-20020a0c8d06000000b006581f67af02si1483701qvb.400.2023.10.04.06.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 06:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dpXLHvzu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qo2K8-0001Uk-EH; Wed, 04 Oct 2023 09:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qo2Jo-0001BE-6d
 for qemu-devel@nongnu.org; Wed, 04 Oct 2023 09:53:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qo2Jl-0002lP-2s
 for qemu-devel@nongnu.org; Wed, 04 Oct 2023 09:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696427616;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dfRZbA01YJUiuxNKBFFhz/y+zEEaB2FKPcBYc0j6bA=;
 b=dpXLHvzuFvua35+BXANdKrsVA1SFvwbRhHSpM/ebyFViGvxTIJpnqdvRA2m20OjcjPxl8L
 UriYrD6GCy3/7E3UzzVu21u4SuVX5vCmJcnQ0djZJD/PKipr+xq5NPCOL7xy8j9GvfMedy
 TNaRVZ6fa1W63VQy35qVGy6GzicO2JI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-9PvPRIP2NemlBKvVWsW91w-1; Wed, 04 Oct 2023 09:53:34 -0400
X-MC-Unique: 9PvPRIP2NemlBKvVWsW91w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4017D18312C1;
 Wed,  4 Oct 2023 13:53:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1621D63F20;
 Wed,  4 Oct 2023 13:53:31 +0000 (UTC)
Date: Wed, 4 Oct 2023 14:53:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 00/13] misc: Rename 'softmmu' -> 'system'
Message-ID: <ZR1uWXEqcyPxsV3g@redhat.com>
References: <20231004090629.37473-1-philmd@linaro.org>
 <ZR1bjpEi5HdFp2xj@redhat.com>
 <85be2979-c0ca-3eb4-dae9-bbabf256c201@redhat.com>
 <00b2ec16-162e-9204-3a04-f45e0edeeb15@suse.de>
 <CABgObfZBTZZvcSPcMSRLWscyEz7B-2h9g28FJx7t7Ggux6E9cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfZBTZZvcSPcMSRLWscyEz7B-2h9g28FJx7t7Ggux6E9cA@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WJD08lIU03k+

On Wed, Oct 04, 2023 at 03:49:31PM +0200, Paolo Bonzini wrote:
> On Wed, Oct 4, 2023 at 3:41 PM Claudio Fontana <cfontana@suse.de> wrote:
> >
> > On 10/4/23 14:37, Thomas Huth wrote:
> > > On 04/10/2023 14.33, Daniel P. Berrangé wrote:
> > >> Am I mis-understanding what you mean by 'finishes' here, as
> > >> I see many references to softmmu remaining
> > >> In particular under configs/
> > >>
> > >> I was also hoping it meant that we'd be changing configure
> > >> to allow
> > >>
> > >>      configure --target-list=x86_64-system
> > >>      configure --target-list=x86_64-vm
> > >>
> > >> for less typing
> > >
> > > Maybe we should also bikeshed about the naming first... "system" is a quite
> > > overloaded word in this context already, and "vm" sounds rather like
> > > hardware-accelerated stuff ... what about using something like "sysemu"? Or
> > > "fullsys" for "full system emulation" (in contrast to "user space"-only
> > > emulation)?
> 
> I agree that changing other remnants should be done right
> after this patch, for example $softmmu in configure. Changing
> all targets is a very large and very user-visible change, it is
> required but it should be planned very well.
> 
> As to the actual target names, I think system is the only
> consistent choice since we have --enable/--disable-system
> (as pointed out by Claudio) and qemu-system-*.  sysemu
> may make a little more sense in the codebase (we have
> include/sysemu after all), but maybe that ship has sailed
> since we have many occurrences of "system", for example
> system_ss and other related sourcesets.

Yep, I agree with that view now, lets stick with 'system'.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

