Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp15924521lfq;
        Mon, 4 Jan 2021 14:11:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJSAiOWyzk6rson1LYyuV+mS5j+1/VANC6xdLroAEcFWod+5SWjkpTKEHNYl/54KfjhaJh
X-Received: by 2002:a25:76d2:: with SMTP id r201mr108869043ybc.107.1609798261724;
        Mon, 04 Jan 2021 14:11:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609798261; cv=none;
        d=google.com; s=arc-20160816;
        b=ONHDE7C/PJIl5vSGoOdSN6FS6u1rA4KS5PyJJulfNuQyvkialClAvXYqxD+d+bsCLN
         YBXaQGHEPfWJGHNxF7fMGWzd+FMM7DM7zl3fFYMhvpA52ENjS0K8IJ7h3bzVyd3HQM7C
         Afno8Xm4KNl0sf5RDGsilwZk9u56OZaYIbtO7Em5a+ji3B1cQd0+XTHMuxY5Nowwcbkl
         om/T3EnHofj+XOCZ2BIzKY03n7l5X4/Ka85VGn0xvhbfsg3iEgSK1ZzenlKW91iCOof0
         8Sf7WsPRWeWCgKLT7h3W4y0uVyE/narjK0xamUEw7edlqDhfwOlu85c7lxUeEMDnENkr
         /HHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=+B+r0+4aZaYYBaD8upICaTg7dnMjcQT09LwD9q+xk6I=;
        b=Nf/UyFoAyo9HIgChxoBdQYLk7z/BhQzEMPzSJUY87Dk4Vz5TMVV1Jp6Fm2xGZu2RQm
         ozXTgPj50i2uzGWXwANYwe+yd2trj6BeXAg8lX5sEcqcmpoo4JYdac0N1Nbskj6guyx7
         LuJxyQEXTZlpL1eajWUy0vLiHI6Jkx+ta5ZysmYpZ4lO0EJbPdjIwH+v1YdeAZi3oOg6
         wfuLyAzg9MuWLY5qbvTuF4W0e4724j6d2yKw3b8Hza88q4SJrRxa8IV5COZV43c4LqWu
         R9TLdB45SaYErd/j5aN/QbIPe+e5fQMIEARUKYHZ6Qb1M73+ESWwKaACoa7npbX+de/Q
         fFrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UBxhZG45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si41261846ybj.237.2021.01.04.14.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 14:11:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UBxhZG45;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kwY45-0005Ok-4S
	for alex.bennee@linaro.org; Mon, 04 Jan 2021 17:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwY3X-0005OM-Os
 for qemu-arm@nongnu.org; Mon, 04 Jan 2021 17:10:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kwY3W-0007DE-6p
 for qemu-arm@nongnu.org; Mon, 04 Jan 2021 17:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609798225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+B+r0+4aZaYYBaD8upICaTg7dnMjcQT09LwD9q+xk6I=;
 b=UBxhZG45TMF/96x06er/EcEMxqSNh5o/Z8gejbhAO0Hyw8lfk/0e3JbKMH0GrKHSwWKJ94
 lFRYO3iT4RDddR591qYqj8alTQrX6gBUzh+7Z9SIsF5B/DSMmohQbwr+/JsvvpqBT57Lho
 a+xo1jPo9xf4tFQKjP+enNtzWJ1MMTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-ycQTF7KoNlGtDn5EJgAHLQ-1; Mon, 04 Jan 2021 17:10:19 -0500
X-MC-Unique: ycQTF7KoNlGtDn5EJgAHLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9B7A107B45F;
 Mon,  4 Jan 2021 22:10:17 +0000 (UTC)
Received: from localhost (ovpn-116-153.rdu2.redhat.com [10.10.116.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28D2E5D9D5;
 Mon,  4 Jan 2021 22:10:14 +0000 (UTC)
Date: Mon, 4 Jan 2021 17:10:13 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v2 0/3] pc: Support configuration of SMBIOS entry point
 type
Message-ID: <20210104221013.GK18467@habkost.net>
References: <20201214205029.2991222-1-ehabkost@redhat.com>
 <20201229142001.3b28fdf2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201229142001.3b28fdf2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Db7nH0QHVgV

On Tue, Dec 29, 2020 at 02:20:01PM +0100, Igor Mammedov wrote:
> On Mon, 14 Dec 2020 15:50:26 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > This includes code previously submitted[1] by Daniel P. Berrangé
> > to add a "smbios-ep" machine property on PC.
> > 
> > SMBIOS 3.0 is necessary to support more than ~720 VCPUs, as a
> > large number of VCPUs can easily hit the table size limit of
> > SMBIOS 2.1 entry points.
> 
> Eduardo,
> do you plan to submit Seabios patches for SMBIOS 3.0?
> will OVMF pick up new tables automatically?

OVMF will pick the new tables automatically.

SeaBIOS patches are at:
https://www.mail-archive.com/search?l=mid&q=20201210212640.2023885-1-ehabkost@redhat.com

-- 
Eduardo

