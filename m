Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5506601lff;
        Tue, 14 Jan 2020 05:27:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwf2QPU5yXDcrQCJq1NfC6rY68Xr1DeAeqATQjqCw86F+C0pa2LlM65BIjjynb43UGttuiQ
X-Received: by 2002:a9d:66ca:: with SMTP id t10mr16758574otm.352.1579008467876;
        Tue, 14 Jan 2020 05:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579008467; cv=none;
        d=google.com; s=arc-20160816;
        b=n5QZAJ7OYcDGb9MreN1YiPGX0+vsJAJAsjUP14I3XcxpivSJf+XrT59y3wELTxGWXi
         sK3j9axr5cOiBlfdik00G6ulxEhr6pR4nlZ1ymRyKwtL5Fx3NrbnhTqz6Ik06jc7Et5a
         AVteQ65F/1vZDQmlz3YuMJYBnVsYX37f1C3BgPMoeS4mi5vVMoqX4nIn4U9It62lEOvK
         AyF/xFOK5aRWu51nDnnyBEp6l41+FlL1kW+nS5WG2lg9BX5BRfFoAd2Lt4T1/imECACO
         YKS10XaaznW3J7auWzL63v4eUYrq9+TJkqE9zQF20639rTx0H6SUrLEmRbzv4Nl9zuNJ
         Q7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :message-id:date:reply-to:user-agent:references:in-reply-to:subject
         :cc:to:from:dkim-signature;
        bh=EhhtFILhKtdjWEYXn99X1dEASzhcaptVYqZRtT+cK+4=;
        b=qbLoquBTCD5js+1+a3p+kuNuqzWVeb/VMcW7YF2sVfvGDPK4uBxggBIGoBdsneOTRb
         mjNOB5f5yrpMH44ewD/ZlEuAqzj+fVF2wj8aJZFB71j58a8vust1rQVH39gOzURydfI3
         ym30YPS70TU6z9TASPLs9BMXctF2Ly2cbAPpHjqB4wsnOwP4Ss503v5AmDfsVF2mVZwB
         OwOaKJXfK6rY7YnlyRvgQ0i8PJF1zdKT+Cs/6M4yadStAAkL0BElhktjekI4CELt7+ch
         awP/kYBy3PF+paq/hWOiFV/MN+nWUXsOg7MpRYFWyRJ8R8JuA7mvfoO1xvD3wdTiIF4h
         mpHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gF2gbEXE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h14si8849349otn.6.2020.01.14.05.27.47;
        Tue, 14 Jan 2020 05:27:47 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gF2gbEXE;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgANN1q (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 14 Jan 2020 08:27:46 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32002 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727289AbgANN1q (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 14 Jan 2020 08:27:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579008465;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EhhtFILhKtdjWEYXn99X1dEASzhcaptVYqZRtT+cK+4=;
        b=gF2gbEXE/SLmtSR+QiFlcJEsaRCUnuCOwSrvWXe4gT3BNDyGJuWLsLKcCmmDr8Oj9+7a3A
        DkMuq37kXBGB0q8HtGSbX7NlpjXuHYLKoq+v/WM4WHl4YqOYkECrzkFj3oefGCTgOifqXW
        xP2je6D/lDEMMmNWcKbFihh0FiVbY24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-K2y3wvQDPTyUR5TpzpjyeA-1; Tue, 14 Jan 2020 08:27:42 -0500
X-MC-Unique: K2y3wvQDPTyUR5TpzpjyeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 205081014DE0;
        Tue, 14 Jan 2020 13:27:40 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.29])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CC4160BF1;
        Tue, 14 Jan 2020 13:27:36 +0000 (UTC)
From:   Juan Quintela <quintela@redhat.com>
To:     Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
        Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        qemu-ppc@nongnu.org,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 06/15] migration/savevm: Replace current_machine by qdev_get_machine()
In-Reply-To: <20200109152133.23649-7-philmd@redhat.com> ("Philippe
        =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 9 Jan 2020 16:21:24
 +0100")
References: <20200109152133.23649-1-philmd@redhat.com>
        <20200109152133.23649-7-philmd@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date:   Tue, 14 Jan 2020 14:27:34 +0100
Message-ID: <871rs2dv7d.fsf@secure.laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZeSpHHZkrivI

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> As we want to remove the global current_machine,
> replace MACHINE_GET_CLASS(current_machine) by
> MACHINE_GET_CLASS(qdev_get_machine()).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

by the migration bits.
