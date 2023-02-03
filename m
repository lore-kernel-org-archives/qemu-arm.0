Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1397247ejb;
        Fri, 3 Feb 2023 05:37:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/E1HcK93T/tTePSZw4eAQjtFHXRuIRkIeCumInFiSw2AIXkpj4StD7tiVfxdU87ar3DBAp
X-Received: by 2002:ac8:5f0f:0:b0:3b8:6ae9:b10c with SMTP id x15-20020ac85f0f000000b003b86ae9b10cmr18525994qta.3.1675431467712;
        Fri, 03 Feb 2023 05:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675431467; cv=none;
        d=google.com; s=arc-20160816;
        b=E4kuCz1QA2iJHhOh9FvjUcE/5xmaVHMcqvBniEOGpLrmxwyt3Ilq/k6QIP4s2gXegF
         sb6R7dmG/I8XcN/zgHlyEiVl+93RpZvZ/ezjxdgfrlHWw/W9VU86x1xagiA9GxcbVqXm
         /0/I4XlGixZ/f9hKacJVmQVR3W8xIFO3tx28uh8AOzj4eaqTxeNREMdNWg6TKB8AbDZ4
         vlDAxpjZdtgLhmZ6dLp4+DGc9j539F8FyFMTyNFHKz9TPbG/7XSFSvhqXkQo75SS/roc
         w16PdRxRrcXRVSgRhsAsh/OeSqrerTsYaEnlcvgySvWEujZGxIF6F7Z1YJa6CoCbZxKF
         C6ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=DrfeX5gacHxcbn2zcDL8HUePYe1yTPohXRz2WwS5TN4=;
        b=jnr3O/2WTpKLFdtXH1QaYmLjG1YUmvvnHLooKVH8DQqvuujrK70CMYDvi3AjOnG4Uk
         fHZr+BhfoDB00qghRkKn/F6ex/NDygYZseHwygrFkKIqdodPfTYS2BZHsBQABOsOOvD7
         t/D2+nTvnGelxs3gPPc0RIvdj0uN8RWSsgfNwVG4aYFhq54D+t/6cH2q5pdRSxX2LYcX
         Q82+fQy1OhH/Ncw2onQ7WLji0LWac2kldPNv9D4XN96BkZ14xJ2gHN71S5J3OkMpNoHc
         UWGDFUP2ZdOsYvE8CquHXIm/jwqkPW83R5+x7Y2+WEzAP79OhXJHIZwdOwQ+xILHrW4f
         VXsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IaBlUO+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a05622a138800b0039ce6373d32si1960727qtk.534.2023.02.03.05.37.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 05:37:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IaBlUO+O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNwG2-0006CL-Pv; Fri, 03 Feb 2023 08:37:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNwFN-0005hJ-4i
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 08:37:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNwFJ-0004sr-4f
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 08:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675431392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrfeX5gacHxcbn2zcDL8HUePYe1yTPohXRz2WwS5TN4=;
 b=IaBlUO+OvznOR6obqTxEWqKkc8EEe946mWIaoImsXt+q+XsY7zFOmPw7cdN/uNifhfKTEO
 NwFGC7SdQCH+9qfTxQeURsqgYJSxG6c4YgxxxqlMqQiw6rw2fTof6OmutxnmuDQns9yWH2
 dGAgCblE4o5SE6lX4n1byrGz5XjuDpI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-FmVIjwpRNyG7OBuy4jaAWg-1; Fri, 03 Feb 2023 08:36:28 -0500
X-MC-Unique: FmVIjwpRNyG7OBuy4jaAWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 994631C0514C;
 Fri,  3 Feb 2023 13:36:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F01A112132C;
 Fri,  3 Feb 2023 13:36:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5718221E6A1F; Fri,  3 Feb 2023 14:36:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/9] hw/i386/sgx: Do not open-code qdev_realize_and_unref()
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-2-philmd@linaro.org>
 <87lelfc4l1.fsf@pond.sub.org>
 <3b377013-778e-b5b4-4c40-bfbecaba8415@linaro.org>
Date: Fri, 03 Feb 2023 14:36:26 +0100
In-Reply-To: <3b377013-778e-b5b4-4c40-bfbecaba8415@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Feb 2023 14:15:45
 +0100")
Message-ID: <87pmaqc1lx.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pXM9B6bUZDq9

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 3/2/23 13:32, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>>> ---
>>>   hw/i386/sgx.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
>>> index db004d17a6..5ddc5d7ea2 100644
>>> --- a/hw/i386/sgx.c
>>> +++ b/hw/i386/sgx.c
>>> @@ -299,7 +299,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>>                                   &sgx_epc->mr);
>>>=20=20=20
>>>       for (list =3D x86ms->sgx_epc_list; list; list =3D list->next) {
>>> -        obj =3D object_new("sgx-epc");
>>> +        obj =3D object_new(TYPE_SGX_EPC);
>>=20
>> I wonder why this doesn't use qdev_new().
>
> OK.

Observation, not demand!

>>>           /* set the memdev link with memory backend */
>>>           object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->=
memdev,
>>> @@ -307,8 +307,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>>           /* set the numa node property for sgx epc object */
>>>           object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->v=
alue->node,
>>>                                &error_fatal);
>>> -        object_property_set_bool(obj, "realized", true, &error_fatal);
>>> -        object_unref(obj);
>>> +        qdev_realize_and_unref(DEVICE(obj), NULL, &error_fatal);
>>=20
>> Yes, please!  Must have crept in after I converted all realizations.
>> I can see two more:
>>=20
>> hw/pci/pcie_sriov.c:        object_property_set_bool(OBJECT(vf), "realiz=
ed", false, &local_err);
>> linux-user/syscall.c:            object_property_set_bool(OBJECT(cpu), "=
realized", false, NULL);
>
> No: these would be qdev_UNrealize_and_unref().

You're right.

>                                                Do we want it?
> Maybe to avoid open-coding it, yes?

I think so.  See

    dc3edf8d8a qdev: Convert to qdev_unrealize() manually
    981c3dcd94 qdev: Convert to qdev_unrealize() with Coccinelle

>>>       }
>>>=20=20=20
>>>       if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
>>=20
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Thanks!

