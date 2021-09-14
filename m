Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp851101lfp;
        Tue, 14 Sep 2021 09:37:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLryHxpuv7RgHMPVGEc06ETOInMXLl8SeBu1bphzWCsZRhSxTybB2t9KlqU6PY8RrOx9xV
X-Received: by 2002:a05:6000:1569:: with SMTP id 9mr23131wrz.343.1631637457085;
        Tue, 14 Sep 2021 09:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631637457; cv=none;
        d=google.com; s=arc-20160816;
        b=yUvBVouab54/ApdH1ZqOXBNDdmn62vPbZ1pmZv+atdE2XhI+EZU9FcGUwnQqntDGGq
         GwcbVpLGO7/rL1LQnTNtIQJr/qKQRuHDFgsHBjsm/ATqt3TmuRvyWQjURP6fFha+E2zK
         yo59kR9nvkt5r/iK0pU9PgYKplsM3fwaoPZP/r6VGLgfbk0TlaH6lhZ+j4IqNor8NS6N
         yL0JGApePrC/Ldsiq2on7vpC6t07keDb0TvLUVKaLNnlJTGksCe9L1dbEEdXRCugAd/I
         bP2g81RvrFYruO1LUqjA9QpSYKH33p6kxMFm2VgkVofAETnzV+1bgwCWa59eERkJuZHN
         jbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=uB/IOM9wvm06euCcwdkC6N9/8Q6PIHGVDPykNlmmfIQ=;
        b=HKiUmFais5GTBkhKFgd614Cg5Vq2W8PXGkhhrPRhz6osM5Na96qbURDfwrgnn5eEYe
         UaCwt9XJiwThBghUKxz4Qm1sFqZEKLIY1MIo6oOazzGl4vkzfgSjQHHax1oAKh5b//JM
         oY+XoxFXi57RRUR3X+nTncNSk8Gro7c4S/YZth0OF9JvaGUaSUK0xIlVQ08uVgKaCNVU
         VQ44NKRUQebkqQjTH/3O59FBteNqgHgPjz/tsMr9KvPpQtKMan4saWSKjb++XeC5dhqb
         Jn5DHKZM3DQWv++Mejp8ScVZ6ekJX8irI9lNkglextIfOhYZXYDzDmB4bUXNdFbVcOQm
         uIng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vx5L3kVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si4051250wri.569.2021.09.14.09.37.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 09:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vx5L3kVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQBRA-0001cm-6s
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 12:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBPF-0008MW-Ix
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 12:35:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQBPC-0007jV-Vc
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 12:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631637333;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uB/IOM9wvm06euCcwdkC6N9/8Q6PIHGVDPykNlmmfIQ=;
 b=Vx5L3kVDEzqs8z7rBdiW/twNsEix6GNuRZBhuPOn4aajT4lP25HHh4OuugRxo2NSJePEu5
 w0NDVuLoH7kXC0cfs5YEnVeeHiPOlRNAzOMUhK593BxHvsW0LibZ1yX/TDgj0GpENwVU+f
 KIfhMZI5piznmiDl9/Ymv54W2RRLdTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-tGaUdgfPPR61IwJzSKKHAQ-1; Tue, 14 Sep 2021 12:35:30 -0400
X-MC-Unique: tGaUdgfPPR61IwJzSKKHAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B5F9104FC26;
 Tue, 14 Sep 2021 16:35:10 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2205DF2F;
 Tue, 14 Sep 2021 16:34:27 +0000 (UTC)
Date: Tue, 14 Sep 2021 17:34:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 42/53] hw/core: introduce a 'format_tlb' callback
Message-ID: <YUDPECQJraD3thwi@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-43-berrange@redhat.com>
 <818d439f-337e-a73c-9e22-fbf8a119435f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <818d439f-337e-a73c-9e22-fbf8a119435f@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6UISRA5Vg6Kl

On Tue, Sep 14, 2021 at 05:56:09PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> > This will allow us to reduce duplication between the different targets
> > implementing the 'info tlb' command.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hw/core/cpu-common.c  |  9 +++++++++
> >  include/hw/core/cpu.h | 11 +++++++++++
> >  2 files changed, 20 insertions(+)
> 
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 4c47e1df18..64fc57c8d9 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> >   * @has_work: Callback for checking if there is work to do.
> >   * @memory_rw_debug: Callback for GDB memory access.
> >   * @format_state: Callback for formatting state.
> > + * @format_tlb: Callback for formatting memory mappings
> >   * @get_arch_id: Callback for getting architecture-dependent CPU ID.
> >   * @set_pc: Callback for setting the Program Counter register. This
> >   *       should have the semantics used by the target architecture when
> > @@ -136,6 +137,7 @@ struct CPUClass {
> >      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
> >                             uint8_t *buf, int len, bool is_write);
> >      void (*format_state)(CPUState *cpu, GString *buf, int flags);
> > +    void (*format_tlb)(CPUState *cpu, GString *buf);
> 
> Doesn't this belong to SysemuCPUOps?

I can't really answer, since my knowledge of this area of QEMU code is
fairly mimimal. I put it here because it is basically serving the same
purpose as the "format_state" callback immediately above it, which was
a rename of the existing "dump_state" callback. I assumed whatever was
there already was a good practice to follow[1]...

Regards,
Daniel

[1] yes assuming these things is often foolish in QEMU :-)
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

