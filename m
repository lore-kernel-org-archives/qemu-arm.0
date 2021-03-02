Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4617675lfg;
        Tue, 2 Mar 2021 08:34:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV/KRoZt1IONkAO2orXOPp39uRlQvt7C0hD+TooFyOrBruKsvOW6q2tLy/b9RWeMF4G+oa
X-Received: by 2002:a6b:fe09:: with SMTP id x9mr11825785ioh.210.1614702875453;
        Tue, 02 Mar 2021 08:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614702875; cv=none;
        d=google.com; s=arc-20160816;
        b=hbcYL6vSK0ZnvVgxjnS9b6JX5QezD0OhOqd/rFYkhuumWX27wnlaHJOxctYgDzZrGb
         geSXTOwhlMbNeADc8AL7Sf2QTPC9sD92+uBjJTtLTnmY/9BIjsi3689UhUU4nmvpWVqV
         OuKK+HPhxrLh/8sEHbFcbTbz1s0Ck3Wput6/8Uix2UaFgvHejlz23bkIAVYpiZOI4/aQ
         Re3shsLHn8bBs62PyMiymPyXeKhKAUWYs3n7M+MPdOUD8W4GPn+VsP//wkM6bTseIGqT
         R1hJV0h2xifaJpA1sXIDq9emD1I0jgV5A2HBwkJLXgUyJMOfnDPQig+3C+PxaUuFQmz1
         E0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:organization:from:references:to:dkim-signature;
        bh=4HrVM4N4mmKWhJxwIjpWi+2K8VEa1HU8gpuaZjrS0i0=;
        b=BL9jo30hP4Vs//j1xz+metQNgeIyI646KUEqXR+B9DOsMXjUvgv3RNJQ4Fu/bu190W
         kMsisiewVdA2pHeD5fdJl+YzmtHoA9pvPZO7qWZtHN9FBHINs96Vez199eNN1f7WeBsL
         zdP7l0INBrn1ytuMphVd7IDl2mUXRwC+7Or8zS1j77u7L0eavY+j7YpYgxtiz1KNxQgg
         LYqWaaKr013o9wcHLjhPfAB9FmRhozztUrmo+9NBgMsGJS1EXz0ZY6Ba4rSdztZq9ZmH
         WDk1A194lezfST22tw6mox8zcCmf4Vbk7Z3rt/5cFJuLHTQ2zF0tNVg9LttkxWOufwBU
         2PkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DuNmiFkF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si19280190ilq.33.2021.03.02.08.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 08:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DuNmiFkF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH7yk-0008Ox-NY
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 11:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH7yb-0008OC-RU
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 11:34:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lH7yZ-0002JS-AW
 for qemu-arm@nongnu.org; Tue, 02 Mar 2021 11:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614702862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4HrVM4N4mmKWhJxwIjpWi+2K8VEa1HU8gpuaZjrS0i0=;
 b=DuNmiFkFz6sDGgwdW0+SvCVtAp/lmAvb0LBvGKzxx4czEIBUnbb20Mg6Qporxh9LPeFBd0
 jjKuSqDHGwMIC2cUNVwE/YnGUdP/EU50O9yfacyHoF7mSf5inl5nDh1Qe6/H4mc4jlcwsy
 RDU4WtQY+xwF65oh/3uI+arvUwWHOXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-Z1NOmVepMWWNhCar2iSuHg-1; Tue, 02 Mar 2021 11:34:19 -0500
X-MC-Unique: Z1NOmVepMWWNhCar2iSuHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13A7A107AD50;
 Tue,  2 Mar 2021 16:34:01 +0000 (UTC)
Received: from [10.36.114.189] (ovpn-114-189.ams2.redhat.com [10.36.114.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 426A2710DB;
 Tue,  2 Mar 2021 16:33:26 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302172323.6cac394a@MiWiFi-RA69-srv>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <db8abe61-a035-fefa-85e7-fe5de1697a18@redhat.com>
Date: Tue, 2 Mar 2021 17:33:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210302172323.6cac394a@MiWiFi-RA69-srv>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ciLQLX0LtHjF

On 02.03.21 17:23, Igor Mammedov wrote:
> On Mon,  1 Mar 2021 11:48:33 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
> CCing Laszlo,
> 
> to make sure there is no complications from firmware side
> (especially when migration is progress, we've ironed it out for main tables blob
> but my memory is a bit fussy about issues we had to deal with if there were any)

Resizing RAMBlocks on the source *while* migrating is indeed problematic 
(and on the destination during actual postcopy phase) - I shared patches 
last year that abort migration in case we ever run into that issue, 
still have to follow up on that.

But to run into that here, I guess we would have to start migration 
before the BIOS comes up such that we actually resize on the source 
while migration is active.

-- 
Thanks,

David / dhildenb

