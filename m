Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp318636lfc;
        Wed, 26 Aug 2020 23:57:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx8INnyuoJ7NR94r9csprVVwARA/jtKnIhOw0yfcXT2F4mxcc85LBDc2IyFUxh03JTtiG2
X-Received: by 2002:a25:4149:: with SMTP id o70mr25078790yba.290.1598511424665;
        Wed, 26 Aug 2020 23:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598511424; cv=none;
        d=google.com; s=arc-20160816;
        b=kPjrux0UJ3OKTw5bhnMYPZ+aqnD7eNPPUqtENJyOUfooi0rM5c7TrRoTm/F0J/ZPCA
         +HN5jwWTfnMhm+BR0RTw4qSFhfCvu7IFuwtzlmtT85f39nZVyuEAPHyC4lyy24QNn1X9
         laDZkXc4tvI5K6zn6qiqHHVmRntaXxxYCXEPrvGbQC91j0nC3VZ3O9JZoHl4TUQEjros
         rJ5E+A3lcZy5hD1nq6yMyhwGr3ewpUDrOvtQBD5xzOSeFagdoTSEuSL9Hqoa7k2pY6N0
         pXwz2M6yBlezmT1fXA3usqewtqsdkIPWcSBrPaT45HTMwJldK2Um/4gFIqE1rOTf3mwH
         V9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rPJ5+y1fY3rbEC4eXpcba4ftNw0KTE3K0N9tI7jMnxk=;
        b=u1LZEAa+zWAAab7cIWf6fvG7+oCb57P6LQjylWsCkgZ+4v34vZRK/vAhHz6uUJrr57
         YazEFx37t5v8FKkHEDfKwFLmrCFVaFU8yHAMT7sWZxnSRSR6y64wbND4abdLYZf3tBTs
         ZJuTEJ413Q6SAkCRkgRXSdkcvJVtjAKcKzdzvQ3cS63uy1dE7xgE2ZT4B6q6/odhlNH3
         eTJW3XlQPTV/Tp1al4OUUetUZv/DM7kefocAHyQW0llLMjjNyT3NGI0bAkf5bYl3tR6k
         ZHFrN2PL2MhgdOr3ee+i5GYOJB1Km7iFY1AfyRE4UBacawOfOpMYAlQ6AEbTlw0L7BLg
         gnhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dvf17fVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si1646311ybo.258.2020.08.26.23.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 23:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dvf17fVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBBqK-0001e7-2k
	for alex.bennee@linaro.org; Thu, 27 Aug 2020 02:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kBBqD-0001e1-6n
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 02:56:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51564
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kBBqB-0002Gk-Ld
 for qemu-arm@nongnu.org; Thu, 27 Aug 2020 02:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598511414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rPJ5+y1fY3rbEC4eXpcba4ftNw0KTE3K0N9tI7jMnxk=;
 b=dvf17fVpkzxgF4IdvsNOKz51RxZuBVaKial/LnvbrurtjOMu11OmOQzji1sWLvx8MRbJDy
 HMWQLWUpYTlZzeH22W60pykAhOPSeyZ40XXfJWefp3/AgVFwQHxeVI4asmpzcK6XmK2MCJ
 Uj16dkbE0j937OsQgWnQBfFsEVQUKpU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-m7BFzVGlM_WtDWVhdsXblA-1; Thu, 27 Aug 2020 02:56:50 -0400
X-MC-Unique: m7BFzVGlM_WtDWVhdsXblA-1
Received: by mail-qk1-f197.google.com with SMTP id g6so3910143qko.21
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2020 23:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rPJ5+y1fY3rbEC4eXpcba4ftNw0KTE3K0N9tI7jMnxk=;
 b=f3i8833HgDfi2dT1hsmaZopimUp9eW9uEms3u94HDs13HeUy9i5t/c5ONOKXViMhd6
 aWSUHx21AsVczlUaScTAa8lqHYW+KtQvlPvWOIGUQw66/cfEQQCheyhD1pKJBUPN5//g
 02kFLsjISUZ9yMz/0y4ob2yCOGKAWT0z8oJxLH0/Dgyi0DtX9ZcHXkTqq9qJgaaIWk47
 2swn0A/7SXWkFrx3HwqD2Jy6soAnsfCzMwk10a8FxFEwHqph1GEpGiD9x5r5yWGfRV5k
 T0tFaNk+sSDSutPUihy4uh5T0iBXTT4Dgmi8TuMxAmCANsiRKcdslAX3k8D6waf2ncu+
 PvTA==
X-Gm-Message-State: AOAM531xCeVcuRiy4fopWLgSKC+mZQm0pzdWJ4LbgIxhx0JzeLHqApSD
 TK8Wc24sU/Tvg6uPggyjMjr6NI3tQSRyoCLL/MIXtdroSJoLhYk2g2tDraJo042DxV4UazoHjx7
 vLIeTAZxMry6lvLUPRF2a/0IRDoqk
X-Received: by 2002:ad4:4dc5:: with SMTP id cw5mr17529780qvb.238.1598511410288; 
 Wed, 26 Aug 2020 23:56:50 -0700 (PDT)
X-Received: by 2002:ad4:4dc5:: with SMTP id cw5mr17529758qvb.238.1598511410063; 
 Wed, 26 Aug 2020 23:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
 <20200826143651.7915-13-eperezma@redhat.com>
 <CAE2XoE9kFuavzHzTWvCony77iHk1_+kjrYj-budDVTdgKfTeaQ@mail.gmail.com>
In-Reply-To: <CAE2XoE9kFuavzHzTWvCony77iHk1_+kjrYj-budDVTdgKfTeaQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 27 Aug 2020 08:56:14 +0200
Message-ID: <CAJaqyWf-v8rx1V5WenepqYVWbN+z7CxWyr=vYe+H=T6DgQJDUQ@mail.gmail.com>
Subject: Re: [RFC v6 12/13] intel_iommu: Do not notify regular iotlb to
 device-iotlb notifiers
To: luoyonggang@gmail.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:13:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zB0U1ZYtLzN5

On Wed, Aug 26, 2020 at 6:52 PM =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo) <=
luoyonggang@gmail.com> wrote:
>
>
>
> On Wed, Aug 26, 2020 at 10:42 PM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
>>
>> This improves performance in case of netperf with vhost-net:
>> * TCP_STREAM: From 9049.59Mbit/s to 9049.59Mbit/s (13%)
>
> What's improvement ? they are the same
>

Ouch, it was from 1923.6 Mbit/s to 2175.13 Mbit/s. Thanks for notify
it, will fix in next revision!

>>
>> * TCP_RR: From 8464.73 trans/s to 8932.703333 trans/s (5.5%)
>> * UDP_RR: From 8562.08 trans/s to 9005.62/s (5.1%)
>> * UDP_STREAM: No change observed (insignificant 0.1% improvement)
>>
>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>> ---
>>  hw/i386/intel_iommu.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
>> index ddb828da1f..7620a1abbf 100644
>> --- a/hw/i386/intel_iommu.c
>> +++ b/hw/i386/intel_iommu.c
>> @@ -1960,6 +1960,12 @@ static void vtd_iotlb_domain_invalidate(IntelIOMM=
UState *s, uint16_t domain_id)
>>      vtd_iommu_unlock(s);
>>
>>      QLIST_FOREACH(vtd_as, &s->vtd_as_with_notifiers, next) {
>> +        if (vtd_as->iommu.iommu_notify_flags & IOMMU_NOTIFIER_DEVIOTLB)=
 {
>> +            /* If IOMMU memory region is DEVICE IOTLB type, it does not=
 make
>> +             * sense to send regular IOMMU notifications. */
>> +            continue;
>> +        }
>> +
>>          if (!vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
>>                                        vtd_as->devfn, &ce) &&
>>              domain_id =3D=3D vtd_get_domain_id(s, &ce)) {
>> --
>> 2.18.1
>>
>>
>
>
> --
>          =E6=AD=A4=E8=87=B4
> =E7=A4=BC
> =E7=BD=97=E5=8B=87=E5=88=9A
> Yours
>     sincerely,
> Yonggang Luo

