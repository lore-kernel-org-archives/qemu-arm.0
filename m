Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2256304ejh;
        Mon, 5 Sep 2022 02:27:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7AwYRc/juA8PanDKrCo9hC9dQdF952T48CorMvAWx+yIZnWe1+SD/er/1eYKMWIdrhSLgH
X-Received: by 2002:a05:620a:1393:b0:6bb:2b7c:5901 with SMTP id k19-20020a05620a139300b006bb2b7c5901mr31197902qki.783.1662370061398;
        Mon, 05 Sep 2022 02:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662370061; cv=none;
        d=google.com; s=arc-20160816;
        b=WL5wPfoM534rhebMfkxXkNove1A9dqD358NCekvrkxJN290U2dcIolHfOhJ6AAAQH5
         jq/JRsrlGh2OOvz8Tu9gt8ukpsGU6e4Bo9Nnrsfd7fJFNN7GjEwfEMHo3aE+GJ8YDMIH
         +cqnxF0fdPN6+sGSLk8MruAL7s5TXY7CBnuQaqDBagHHVr5PM5sH4PPCbSeB92rSXi8i
         x5675HaiIBmhRgefbn6L4+vevYvhcrI6UcfwG+fUX8PlOoQvpW02ciip6zk+EfA3XJ47
         aD8vzlGr0pHPhoecZHhuomiJJzhexp6emhp3k13YvbUOeEP+DWXBgWoD/T19DW4KAHe6
         1ghA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=Xvur3lKd5oPLjfDV8Minhh75IzAjvI+RUndNoKgiZxM=;
        b=MgYL+HdskDawRv6jv7ycNaDpWdOMNVm6HE6ITS12Su4lwZc+i0orKBvGYSFEopZgBE
         30QIywFYxa1YQawJPackebZueGMtoSblz+YokUbtKLEE3q+18pofJ8fbC1xGBWv3NzML
         WNvoQbOyW3UDrIDVZk8HN/w3d86Ml2MTEmP7UHBw9EqyAqovb0fATzRB9JDqaEdLkg/S
         w8H9gG1meZDQXs7la1mK75z3XQiC3CbbAMMwG6/6Q5GJ6j8hmxf5yR2V0F3ynyBq5N6x
         /+uqKE3GmQ7cgvG022yh7JiIp1pp18aePuEq27sf/oCR5xIWoScg0MX++9/wre5QDpLZ
         Pcfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dFI8pczc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020ac84593000000b00342f67a1d70si5666305qtn.601.2022.09.05.02.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Sep 2022 02:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dFI8pczc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oV8OK-0004EW-O3
	for alex.bennee@linaro.org; Mon, 05 Sep 2022 05:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oV8NS-0004Bv-OE
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 05:26:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oV8NO-0005AB-Vh
 for qemu-arm@nongnu.org; Mon, 05 Sep 2022 05:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662370002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xvur3lKd5oPLjfDV8Minhh75IzAjvI+RUndNoKgiZxM=;
 b=dFI8pczcnXzT0uLxBFQlCnD9z9u8/SWb/GoFFCHv8vX00QVJQvu+oSaScS/JwsysGhuCIO
 wRX57vsHGriXqPSHcgwvhorlZGXaDo7i+BZ84rVXKatYMRA6M0s9Pcmiup9Bb+UHDEBbRE
 7gqSSGyycB30w/nVkoQkHN5XoBTn3NM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-nOcA3qAbOw2HTotfhPaApQ-1; Mon, 05 Sep 2022 05:26:37 -0400
X-MC-Unique: nOcA3qAbOw2HTotfhPaApQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7A913C0CD45;
 Mon,  5 Sep 2022 09:26:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 404A04010E3C;
 Mon,  5 Sep 2022 09:26:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BA54D21E6900; Mon,  5 Sep 2022 11:26:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,  Eduardo Habkost
 <eduardo@habkost.net>,  John Snow <jsnow@redhat.com>,  Dmitry Fleytman
 <dmitry.fleytman@gmail.com>,  Jason Wang <jasowang@redhat.com>,  Stefan
 Weil <sw@weilnetz.de>,  Keith Busch <kbusch@kernel.org>,  Klaus Jensen
 <its@irrelevant.dk>,  Peter Maydell <peter.maydell@linaro.org>,  Andrey
 Smirnov <andrew.smirnov@gmail.com>,  Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: Re: [PATCH v2] pci: Assert that capabilities never overlap
References: <20220831013236.32937-1-akihiko.odaki@daynix.com>
 <87tu5qulay.fsf@pond.sub.org>
 <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
Date: Mon, 05 Sep 2022 11:26:34 +0200
In-Reply-To: <CAE=JJXdg=Miisek8WeqQ12NqL8obzmuyzD0mbv1SfiJTyVBLuw@mail.gmail.com>
 (Akihiko Odaki's message of "Sun, 4 Sep 2022 16:06:55 +0900")
Message-ID: <875yi2mat1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: navn+4IGl34x

Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> On Fri, Sep 2, 2022 at 7:23 PM Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>
>> > pci_add_capability appears most PCI devices. Its error handling required
>> > lots of code, and led to inconsistent behaviors such as:
>> > - passing error_abort
>> > - passing error_fatal
>> > - asserting the returned value
>> > - propagating the error to the caller
>> > - skipping the rest of the function
>> > - just ignoring
>> >
>> > The code generating errors in pci_add_capability had a comment which
>> > says:
>> >> Verify that capabilities don't overlap.  Note: device assignment
>> >> depends on this check to verify that the device is not broken.
>> >> Should never trigger for emulated devices, but it's helpful for
>> >> debugging these.
>> >
>> > Indeed vfio has some code that passes capability offsets and sizes from
>> > a physical device, but it explicitly pays attention so that the
>> > capabilities never overlap.
>>
>> I can't see that at a glance.  Can you give me a clue?
>>
>> >                             Therefore, we can always assert that
>> > capabilities never overlap when pci_add_capability is called, resolving
>> > these inconsistencies.
>> >
>> > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>
>
> Looking at vfio_add_std_cap(), and vfio_add_ext_cap() it seems that
> they are clipping the size of capabilities so that they do not
> overlap, if I read it correctly.

If we want to deal gracefully with buggy physical devices, we need to
treat pdev->config[] as untrusted input.

As far as I can tell:

* vfio_add_capabilities() replicates the physical device's capabilities
  (starting at pdev->config[PCI_CAPABILITY_LIST]) in the virtual device.

* vfio_add_std_cap() is a helper to add the tail starting at
  pdev->config[pos].

Could the physical device's capabilities overlap?  If yes, what would
happen before and after your series?

