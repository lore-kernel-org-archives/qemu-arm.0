Received: by 10.25.0.6 with SMTP id 6csp144339lfa;
        Tue, 9 May 2017 06:57:21 -0700 (PDT)
X-Received: by 10.99.147.67 with SMTP id w3mr181001pgm.145.1494338241733;
        Tue, 09 May 2017 06:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494338241; cv=none;
        d=google.com; s=arc-20160816;
        b=Xo2VJpjSMqQaJQVwiarmvxYQkPUkulQ6OBLBtFhYJ9mAQSaUVPicuD3QGqRs5dFozc
         kTjU6ADgABfRAptb/1RV85HjF6Vf6NIAPETr+cSK/AzAo3TroeC7sf/KFKy+wGyhgjMe
         G1NqQYdFUQI2vs93VyLdem5G5N3NvvK640OyoV+LSaTwDwkZ5RgWYr8jL9jBqKelyoI0
         XgAp5NGtnJL/Efw/m3F7e5W+gcSCJKEjUZfA4DAkdY81GHFIcIn/wTCMeNDDHcw4Vl+3
         XRKFep003J00BETlJqAJLnFqZ8W4SqPivg5a/ZL1QW8UtPq+ctxHvG+FIVPcuBTUYPJ1
         AFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:message-id:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:subject:cc:to:from
         :date:arc-authentication-results;
        bh=9pCMoXGfeVGd9l49I8fArOfkMmw1KDPbzJZeMBAsm0U=;
        b=yhqtkpT+tDDA0m4B5lQsYC2T7EJRVvjkxzyHfd62z/raYaxKEkJ2P7YgZwbEpHqXJs
         jUnAIs6SCgGYJ6JKeueS6HY/JD0J7lP7e/FQszeE7ddeBdd2U4kZaweqqtTlI210dZQK
         /ZhKtVsKlh0YfAyzGxM2+oQsmNIxOHdmomDG230ioqr6ZgxjI425kBWzMC06rPrKSxfP
         bCi7IqIisGtYO2C1vBi9+kp+NevL7od/d61I7xXCCq9TjcgcwqD25qNiGwHxilzrIQgW
         jR0ohe01/ecUO43MdoII6n5u24ALaRzkqdDJuQo6X/74WAYnQ0fu8ie4b0QmsW15xPQN
         gevw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z78si9027448pfj.313.2017.05.09.06.57.21;
        Tue, 09 May 2017 06:57:21 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752054AbdEIN5T (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 9 May 2017 09:57:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38129 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751210AbdEIN5S (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 9 May 2017 09:57:18 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v49DrWqq048061
        for <kvm@vger.kernel.org>; Tue, 9 May 2017 09:57:18 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2abea0ahb3-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <kvm@vger.kernel.org>; Tue, 09 May 2017 09:57:17 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <kvm@vger.kernel.org> from <cornelia.huck@de.ibm.com>;
        Tue, 9 May 2017 14:57:15 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 9 May 2017 14:57:05 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id v49Dv4gR39125108;
        Tue, 9 May 2017 13:57:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5208652041;
        Tue,  9 May 2017 13:54:28 +0100 (BST)
Received: from gondolin (unknown [9.152.224.119])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6C81F52043;
        Tue,  9 May 2017 13:54:27 +0100 (BST)
Date:   Tue, 9 May 2017 15:57:02 +0200
From:   Cornelia Huck <cornelia.huck@de.ibm.com>
To:     Eric Blake <eblake@redhat.com>
Cc:     qemu-devel@nongnu.org, armbru@redhat.com, berrange@redhat.com,
        alistair.francis@xilinx.com, "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Andrzej Zaborowski <balrogg@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Paul Burton <paul.burton@imgtec.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Alexander Graf <agraf@suse.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Walle <michael@walle.cc>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Stefan Weil <sw@weilnetz.de>,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        qemu-arm@nongnu.org (open list:Calxeda Highbank),
        xen-devel@lists.xenproject.org (open list:X86),
        qemu-ppc@nongnu.org (open list:Old World),
        kvm@vger.kernel.org (open list:Overall)
Subject: Re: [PATCH v7 3/5] shutdown: Add source information to SHUTDOWN and
 RESET
In-Reply-To: <20170508211953.28017-4-eblake@redhat.com>
References: <20170508211953.28017-1-eblake@redhat.com>
        <20170508211953.28017-4-eblake@redhat.com>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
 Aufsichtsrats: Martina Koederitz =?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
 Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
 Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17050913-0016-0000-0000-0000049729AB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050913-0017-0000-0000-00002795E9F2
Message-Id: <20170509155702.0d7cb606.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2017-05-09_11:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705090074
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Narq8CnSJnXs

On Mon,  8 May 2017 16:19:51 -0500
Eric Blake <eblake@redhat.com> wrote:

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
> Replay adds a FIXME to preserve the cause across the replay stream,
> that will be tackled in the next patch.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Acked-by: David Gibson <david@gibson.dropbear.id.au> [ppc parts]
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> [SPARC part]

> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index 68bd2f9..d2bb9aa 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -266,7 +266,7 @@ void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr)
>          S390CPU *cpu = s390_env_get_cpu(env);
>          if (s390_cpu_halt(cpu) == 0) {
>  #ifndef CONFIG_USER_ONLY
> -            qemu_system_shutdown_request();
> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);

Looking at this, I think the non-kvm code path might want some panic
handling for disabled wait, but that would be an orthogonal change and
this transformation looks reasonable.

>  #endif
>          }
>      }

s390x parts:

Reviewed-by: Cornelia Huck <cornelia.huck@de.ibm.com>
