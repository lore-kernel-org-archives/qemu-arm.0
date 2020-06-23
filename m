Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4193391lfm;
        Tue, 23 Jun 2020 08:51:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/B16h+W/u/8h2EgG3XYYGK1WrNkWbtTPERPVxqbSTpnqV5RgoAzMfOBx1WHwWxGHk32e/
X-Received: by 2002:a50:f009:: with SMTP id r9mr2106724edl.72.1592927471432;
        Tue, 23 Jun 2020 08:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592927471; cv=none;
        d=google.com; s=arc-20160816;
        b=UvWzonJax4x/ochKkeA6TUmG7/SkU+j0LoDz5ASSpLIXtQnRodWa1kwOhL/CIUKDII
         G98MLMH8VmCY7iowZbtdoiIAOmi8ViezROF2+Ix+K54txZwe3IxKjdQRB7FRBD3GvxMg
         8MQxeLAxGCjbmIInmnCBtAMNVoyhH0xbrH4Qby70WKBHg4DSgR0KqEJ2H6DUqM0E9r0M
         iTKHryiZMZM43m8RwEkiH45BQtV7KszkHewtwi+oUBLgc8ZVBKnBECJ5NGiDC/s6GtSP
         bor59fAl+WwPtpiGUYAKDCQ4ZyBSuOPUwC2JfXBrLHsqy9LHCEgXd2WcMwW78vreQJ7M
         sYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :organization:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=U59aUKaHON6D7wc3ZgtCJStGneCJUIZPhgdNzvltSN8=;
        b=spdmElpx2pzK9+dqLHSFD+iqTaCMEPLvnsS+kwHpK23WAggFapHmT24r6ChPPG4u8b
         ZNJAyVSBoxRe+LVfqCt9uclDce7g9DljTyx5raYqg3e262P5AG67MXZNd6jMsy053weY
         Echugyr1V4uABT8Wz6kGCokJj9iYtkdO1Q0ipeBRTGzfv/+dtUhsSN6WtfCMhdWyhKQl
         mCwRt0Cpk1tVZNY4dN7yI3MRUC3mZzteldKvJuGlXl59kzQUxn6qqewSxrJpbD6seY7H
         athrbAn9XLSzky6fGXVOYlBAQY//yUxs9mHR65hdlKsf3FvqLSBX4x/xJNTVc6aR9idQ
         iwcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VENbCsl0;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id y24si11951251edu.80.2020.06.23.08.51.11;
        Tue, 23 Jun 2020 08:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VENbCsl0;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733007AbgFWPvK (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 23 Jun 2020 11:51:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21657 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732942AbgFWPvK (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 23 Jun 2020 11:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592927468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U59aUKaHON6D7wc3ZgtCJStGneCJUIZPhgdNzvltSN8=;
        b=VENbCsl0bUzJIUUt83J53W8tz27VdHLE2W0nH3dF6IN4j9fw5ILNaomxx+30xgbfkqD3Qb
        S3oUz+hc1u/omF61Xu7w+NhbHkCcb6FVWRdlYIf2AYItksj+6mbgCbEoKVhz3ompDFt8MV
        IVux9fndhqltbrs+rqci7cgoWlDEe94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-nyV9kjAYPGie_T5WYnW2AQ-1; Tue, 23 Jun 2020 11:51:07 -0400
X-MC-Unique: nyV9kjAYPGie_T5WYnW2AQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1236A0BE2;
        Tue, 23 Jun 2020 15:51:04 +0000 (UTC)
Received: from gondolin (ovpn-112-222.ams2.redhat.com [10.36.112.222])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA9F26109F;
        Tue, 23 Jun 2020 15:50:55 +0000 (UTC)
Date:   Tue, 23 Jun 2020 17:50:53 +0200
From:   Cornelia Huck <cohuck@redhat.com>
To:     Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc:     qemu-devel@nongnu.org,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        David Hildenbrand <david@redhat.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Richard Henderson <rth@twiddle.net>, qemu-s390x@nongnu.org,
        David Gibson <david@gibson.dropbear.id.au>,
        Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
        qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/7] accel/kvm: Simplify kvm_check_extension_list()
Message-ID: <20200623175053.26b5558d.cohuck@redhat.com>
In-Reply-To: <20200623105052.1700-4-philmd@redhat.com>
References: <20200623105052.1700-1-philmd@redhat.com>
        <20200623105052.1700-4-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: WYRBoksxi1wu

On Tue, 23 Jun 2020 12:50:48 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> The KVMState* argument is now unused, drop it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
