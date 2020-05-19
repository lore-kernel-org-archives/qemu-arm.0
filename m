Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3696124lfb;
        Mon, 18 May 2020 22:09:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbEvpGwQD4y15TimgLteVeCiArIPGr5sv/CaZ+BbyJJBLCssltf99VEkk5dT/LFHZOCD+S
X-Received: by 2002:a05:620a:6b7:: with SMTP id i23mr18679405qkh.156.1589864995793;
        Mon, 18 May 2020 22:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589864995; cv=none;
        d=google.com; s=arc-20160816;
        b=fH6OdOqXC6TSoyzwQW9MztizxSZmjHRR+/drUxRoWnkHfH/f8xJvpfcFVJ3sj2RPf+
         SRjg6UC19cl8ivFCsbRoTIiZaiHSwCMAvPNiUmSSkY4UrPjT93rt4XKz2XzmrkuQfjGU
         x2Fw7SGJue90PrzkheYGIXt9FpggZgAvWQCyoZgh4fvN86+0T3+sWYPdAkkjBGctQtrY
         jBlTrbVP4L5Q8lvt901tcn5mSaZB0B/2WZHPYjzv3V0ZAwvkDZ9YeiVRjBBOEmITAb91
         Bj8Jmbhu2FQss46H0QDi2uLA1h3DtOH3f777BIR3bRRNN1S4i3f5S1Z3x4iDZ9zo+8fe
         x8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=ilbqsHy+xICnEenpAbh6ON1IN2Xe0LpX9BaFbbNxkDI=;
        b=oXiw/CVfwxpJ//2dIg9iBPaoHETCpvf00WgFELKjLeVDi4kH7jHXUlzLCjRPZcLVvP
         bNHhk+tT+hMKuRl/TamSUyUy9HDJtrAQmerWHNpvMn5Al+ygLRTh+CdpLUJ4v3FpOA0v
         Ia5EbMCoYZehRCNSt7xt+klSYIb7QQPZJxmbkUpzduiNZiaD9as/9V7DxWB1cdFB/Bi8
         ABV/dK0wzWPRrzz7U5zc2VHSyZQW+dcLYEGo3wmJIcmGhbd1bpRJObaD+7xvkdIrmn/d
         m1q5E+tHqShV33exCtNfX+nd8xrtgFpl4yfR7xH1bZIT/5/eJBMEM9JBagAFIs3MASDJ
         +1bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WABXn07B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si5521274qtm.223.2020.05.18.22.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 22:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WABXn07B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jauVn-0007F2-9o
	for alex.bennee@linaro.org; Tue, 19 May 2020 01:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jauVi-0007Ep-4f
 for qemu-arm@nongnu.org; Tue, 19 May 2020 01:09:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25176
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jauVh-00038E-3H
 for qemu-arm@nongnu.org; Tue, 19 May 2020 01:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589864987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilbqsHy+xICnEenpAbh6ON1IN2Xe0LpX9BaFbbNxkDI=;
 b=WABXn07BzXLPujzKCuprUI/7DDWo2NEjMur0iEnMtelwFcH+j8HJmAZs3qBMeLGleZ4v2c
 M6QGC2ar+qfJZcfAyC+GvCE3NwgNRdXjy9KIh4n03vp9Hmc/tuQ2F6MTt7RQ+VbixSZsOt
 N2+4Yai62lnq0d5dMSmZ4HMyHD9BoNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-8758fI4lMj2Zo0Mmmp2nLA-1; Tue, 19 May 2020 01:09:44 -0400
X-MC-Unique: 8758fI4lMj2Zo0Mmmp2nLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7134D1005510;
 Tue, 19 May 2020 05:09:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11B6160BF3;
 Tue, 19 May 2020 05:09:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 62EC211358BC; Tue, 19 May 2020 07:09:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Fred Konrad <konrad@adacore.com>
Subject: Re: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-3-armbru@redhat.com>
 <d6b1e66a-23be-e38f-1140-9b45618741e7@adacore.com>
Date: Tue, 19 May 2020 07:09:40 +0200
In-Reply-To: <d6b1e66a-23be-e38f-1140-9b45618741e7@adacore.com> (Fred Konrad's
 message of "Mon, 18 May 2020 10:19:50 +0200")
Message-ID: <878sho7bor.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 00:34:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GC2zP20ofotI

Fred Konrad <konrad@adacore.com> writes:

> Le 5/18/20 =C3=A0 7:03 AM, Markus Armbruster a =C3=A9crit=C2=A0:
>> xlnx_dp_init() creates these two devices, but they're never realized.
>> Affects machine xlnx-zcu102.
>>
>> I wonder how this ever worked.  If the "device becomes real only on
>> realize" thing actually works, then we've always been missing these
>> two devices, yet nobody noticed.
>
> I can't tell, but it used to work back in 2016 since these devices were r=
equired
> to have a working framebuffer.

I don't doubt you.

I figure the "device becomes real only on realize" thing is actually
more myth than thing.

