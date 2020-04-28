Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5349036lfm;
        Tue, 28 Apr 2020 04:02:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypLp6uwmH3NsJFoj1cncS4IxI1nQNWtwaQLG4tXCPPSq2tHkEqLMysHjM94caOps4tM+56c/
X-Received: by 2002:ac8:2c66:: with SMTP id e35mr28367593qta.188.1588071762539;
        Tue, 28 Apr 2020 04:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588071762; cv=none;
        d=google.com; s=arc-20160816;
        b=Oqi+dalHHPRI+kybos/fJtxO9QHZ8y0aS4Wds5WSbnyabY7+8w9f/r2oQayiqF2tXE
         oBoTETRRc1qQinj2QqvZmfiLfhMJjabD/gqeqTZvOGZOU/VC4Jy3rsFYSZqfgxIcb6Ji
         m4+B/LUWWeIYBLosa2Rua/e+Khrpd5KdxRbj2SSHxYkn4StAN567xXtUs4EJ0NBZRJX/
         ioBHNHq0Is9rCh2Uq0dBYdPMfVvL/2T3Bz5NdqRmQaztX0boB/TBuneKavfNVbNNoihc
         AOO2n0yyr4Z+5O/fv25bXPnojP9Cc3cxNnm9CHsU9ErdAOamDCzEkXQ6DL8evPTlm0PS
         YHpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=SHLPGXc409eUxZRDhpYEHBHNduJDHeD9ZouHUXYqzxU=;
        b=KUQyxifazo7KNneGNC5fTBU3fmVLgeheAX29O2tb0Cjmu93WuN1FohAvgXxsmNyKLE
         Wrw/qT4NHPoIjSiLogc3chOI2UNzCe5DOL1EDldir9otd6SQv/ajOG40vnI0b9lAcCTs
         GA87qpdAPDusR7dFIVosLPE0seVqTig6LR91JT4nipBD8MAzpvCULAtBXqqkkKtNtGOg
         +48qvhYrkai/PShmilHpeovZyYZrr+6h64DtYL720mHiJ+cWqRJ1e50JlWIq+E2e3SCx
         hu23GuPBMALmlFhIgmtBLbdHv1PjDnQm6EJ07J0EaEhMij97jXnvDmrJjRgE0ZvyO35J
         AfWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EK97ttN7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si36143qvy.118.2020.04.28.04.02.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 04:02:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EK97ttN7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTO0f-0001sY-US
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 07:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jTNza-0000Xs-Bu
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 07:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jTNzV-0007PA-1j
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 07:01:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30049
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jTNzU-0007On-F0
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 07:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588071686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHLPGXc409eUxZRDhpYEHBHNduJDHeD9ZouHUXYqzxU=;
 b=EK97ttN7lcdWhxYvASVEhL+YHKz45lXc4hCFz4WrkrTV7KcxoaEjJpHkegfYKuwAvYkPAM
 oen7oO5nPhUT3WQLNdtdv/Hi3KrlTQAO3S3nryr6XmGoIvROi8aOLwaoaTeM93zosFV4oN
 leyzSpM1ra2+V4j95WoAHgHESPed6OA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-HqtvUGOPO_u8a9vt6omsWw-1; Tue, 28 Apr 2020 07:01:25 -0400
X-MC-Unique: HqtvUGOPO_u8a9vt6omsWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE3971895910;
 Tue, 28 Apr 2020 11:01:23 +0000 (UTC)
Received: from [10.36.114.119] (ovpn-114-119.ams2.redhat.com [10.36.114.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EA84611D4;
 Tue, 28 Apr 2020 11:01:19 +0000 (UTC)
Subject: Re: [PATCH 0/2] virt: Set tpm-tis-device ppi property to off by
 default
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 cohuck@redhat.com
References: <20200427143145.16251-1-eric.auger@redhat.com>
 <a5bb0ccb-2dc4-67e2-f0df-98c349e6e94f@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <df3080eb-80d6-5dab-6fd8-973a3764ab5c@redhat.com>
Date: Tue, 28 Apr 2020 13:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <a5bb0ccb-2dc4-67e2-f0df-98c349e6e94f@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:16:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2aftQcZry5D1

Hi Stefan,

On 4/27/20 10:21 PM, Stefan Berger wrote:
> On 4/27/20 10:31 AM, Eric Auger wrote:
>> Instead of using a compat in the mach-virt machine to force
>> PPI off for all virt machines (PPI not supported by the
>> tpm-tis-device device), let's simply change the default value
>> in the sysbus device.
>=20
> There is no change in behavior on any arm machine due to this patch,
> right? So backporting would not be necessary?

Indeed, there is no functional change as we keep PPI off. My
understanding is we can safely remove the compat mechanism. I tested
migration between virt machine with compat to virt machine without
compat and conversely (without tpm-tis-device though) and it passed.

Thanks

Eric
>=20
>=20
> =C2=A0=C2=A0 Stefan
>=20
>=20

