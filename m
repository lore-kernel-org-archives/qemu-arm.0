Received: by 10.25.0.6 with SMTP id 6csp1769066lfa;
        Tue, 16 May 2017 01:47:22 -0700 (PDT)
X-Received: by 10.84.217.28 with SMTP id o28mr14397414pli.37.1494924442739;
        Tue, 16 May 2017 01:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494924442; cv=none;
        d=google.com; s=arc-20160816;
        b=F3TgQgC0XQ/3dCGIFzBKKivfDSfgyNlA0iVFW77HSC27hBvmPJGiBEH/3IJfyZlesL
         Xe0lRy7/W29onjN38bUu7YF+38Wz9U8KNBBJW7T/+wkVsdcXsMrJO/6DVtPnex1Htg5R
         YyTmVKlU5i0OzmafjkY9p9acTy0Akrt3Lm1E5OWUl/IWBEsueGc52H+wSwQDj8OKPVAR
         g9Wtn1PVyiDhgiO5NvKomSwoDAa5/eyXuP2xX+KBRZ+gnEvhxLSQ8opnAD25iwXSg+F4
         RnPXj9obxnwfTHnUrQd4PODR2PdI4ONWNxsB3e5v8nOJ30OVhu1+u3dzY4xOOReSWdSf
         XJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=niY2ptuvQOMyt2XWEWiKS1uDyZ27drFOsu5OtQV6Lc0=;
        b=kSNNXSK+2gVmXVAXFtq3VGTVeqLvn7Uj5BgsBaps5x0ST/DcjphDpN4YPHGxA2i2ZN
         9wV2hiynwO1LgYoV5j5M7jNHPkvB5FXX9Y3jSc0lbk1BKohW9gFu8YBtm9N+nLkku7ss
         KZCadnJ1OdmNDsiPWRSZfk/ZuyraODr0jgBw2XKAM4gJofknk2ftBpbZA+3kQDO9I/UM
         SD7q00HxeI1cPKJZN/WdTpxMbpd7ModdEdp7PTRIB4cxvaCVEbYYdkDMeCsmgZeuhJUr
         4Qg1+oimoUXESw8AJpRpZ/FEGCVMSriVUMLPT53Hh1svtEMht/5cqbz5IcssjTH5GB6H
         SbJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x11si12994257pls.74.2017.05.16.01.47.22;
        Tue, 16 May 2017 01:47:22 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751864AbdEPIrU (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 16 May 2017 04:47:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54802 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751300AbdEPIrR (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 16 May 2017 04:47:17 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 8C181804FA;
        Tue, 16 May 2017 08:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8C181804FA
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8C181804FA
Received: from blackfin.pond.sub.org (ovpn-116-54.ams2.redhat.com [10.36.116.54])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D0BA5BF845;
        Tue, 16 May 2017 08:46:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
        id 28EA01138647; Tue, 16 May 2017 10:46:57 +0200 (CEST)
From:   Markus Armbruster <armbru@redhat.com>
To:     Eric Blake <eblake@redhat.com>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        "open list\:Overall" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Alexander Graf <agraf@suse.de>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list\:X86" <xen-devel@lists.xenproject.org>,
        Richard Henderson <rth@twiddle.net>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>, alistair.francis@xilinx.com,
        "open list\:Calxeda Highbank" <qemu-arm@nongnu.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
        Igor Mammedov <imammedo@redhat.com>,
        Cornelia Huck <cornelia.huck@de.ibm.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Paul Burton <paul.burton@imgtec.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list\:Old World" <qemu-ppc@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-devel] [PATCH v9 4/5] shutdown: Add source information to SHUTDOWN and RESET
References: <20170515214114.15442-1-eblake@redhat.com>
        <20170515214114.15442-5-eblake@redhat.com>
Date:   Tue, 16 May 2017 10:46:57 +0200
In-Reply-To: <20170515214114.15442-5-eblake@redhat.com> (Eric Blake's message
        of "Mon, 15 May 2017 16:41:13 -0500")
Message-ID: <87y3txfata.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 16 May 2017 08:47:16 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ur34loQiway9

Eric Blake <eblake@redhat.com> writes:

> Time to wire up all the call sites that request a shutdown or
> reset to use the enum added in the previous patch.
>
> It would have been less churn to keep the common case with no
> arguments as meaning guest-triggered, and only modified the
> host-triggered code paths, via a wrapper function, but then we'd
> still have to audit that I didn't miss any host-triggered spots;
> changing the signature forces us to double-check that I correctly
> categorized all callers.
>
> Since command line options can change whether a guest reset request
> causes an actual reset vs. a shutdown, it's easy to also add the
> information to reset requests.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au> [ppc parts]
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> [SPARC part]
> Reviewed-by: Cornelia Huck <cornelia.huck@de.ibm.com> [s390x parts]
>
> ---
> v8: rebase later in series

That turned out nicely.  Thanks!

Reviewed-by: Markus Armbruster <armbru@redhat.com>
