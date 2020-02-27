Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4173287lfg;
        Thu, 27 Feb 2020 01:06:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqyg+w159clSd9s38ZWpwb5MxVyOlgrSNyv3aFzx/A9DkQ9zuf9ZPF0zemBNHrgF+nldYdt5
X-Received: by 2002:a37:91c2:: with SMTP id t185mr4013732qkd.284.1582794412746;
        Thu, 27 Feb 2020 01:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582794412; cv=none;
        d=google.com; s=arc-20160816;
        b=ABbtPLpbAKSr3Ags/GZpRA7kDPHvBKy/pf5vBIa49nlDwoiyT283g2IaC1fsUdQNUq
         e3obD8Kkd3TzHw3Q8E1jO5KpIvG5CAV4U8cZEN9/DsFc46cN0yeqSMtfgdi6J5Ao4Rdy
         bqyKfWo6gnxd0LaujXgBitvR/JLb7ko7JxN3oDT9vh0zrE5BfbmF+LWKfZK6eOu9TPPH
         vhwEQOTmXo8XXzcRoss8dHfjScscbVv1mIl/JIv3vc9EkbJoMLaF5dwq+tKel2uCFPvC
         Uv4K+4mXJ8F0tI72TKYEuf52V5yq4pFjXOsdL/BtIriSPDCGq2fBSYLNsjzcF5xQbimg
         tIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=2U5vMT3JdBAOxnGxXsjcLScn+I4d1aJDFb5ALjfamB8=;
        b=AYfr/WRWuvIFi3Q0EmRBBBUfGeOBYxQ6Au4xB9DR/6BDzWfreyT+oK3M4ezrocN0TX
         XDFb6JqIWajbRO86f/px5a64bzkaxNsJj9bfvlfyPuRWY+D5nfaszEHqyj1f9S1d9aH9
         aa1TwhKAcJwqH0W75dC7VlgpY00nhZBxhUQkKSqaiGBQJ4Y71zKtmYq29uitvCCukYKy
         ieTobiNHkbDKYh3ReJEEnD3djTaadRvb4RWOf9907A91VPb+SCum0Um6G5CVafJa5hUr
         aM/kHFAuyiYiAdMNAONiGfp7zxLphF7W5nmtDMih2utBZo7XmEM0BfZLbBpBdRhsghV8
         i4pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cH/aP3xI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si1124833qki.62.2020.02.27.01.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 01:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cH/aP3xI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7F88-00026X-4X
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 04:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j7F80-00026I-Is
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 04:06:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j7F7z-00059D-5E
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 04:06:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29664
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j7F7z-00057M-15
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 04:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582794402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2U5vMT3JdBAOxnGxXsjcLScn+I4d1aJDFb5ALjfamB8=;
 b=cH/aP3xIR7WsPahGKWCw4EaOmWUrQ0u3MvZcKHl5EXrJbNapIQi2q5imeAYefn0qHejlay
 cSEdEhhmUIDkDWIPFtBsPE9oQMI0V8sFB9KRePiFPvGcpojvmMriaNCdtffj+uJcRbUqNX
 hcM5o+YiXPuK0tfxXgLOYKN9WnXXHcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-S14ry7VcOtOWE5te-nZbJg-1; Thu, 27 Feb 2020 04:06:41 -0500
X-MC-Unique: S14ry7VcOtOWE5te-nZbJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86AAE8017CC;
 Thu, 27 Feb 2020 09:06:39 +0000 (UTC)
Received: from [10.36.116.36] (ovpn-116-36.ams2.redhat.com [10.36.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7D5F5D9CD;
 Thu, 27 Feb 2020 09:06:33 +0000 (UTC)
Subject: Re: [PATCH v3 1/6] s390x: fix memleaks in cpu_finalize
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Pan Nengyuan <pannengyuan@huawei.com>, peter.maydell@linaro.org
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-2-pannengyuan@huawei.com>
 <59af1e29-8075-a25c-dd80-e93cc21bb328@redhat.com>
 <399dfb54-62b7-945b-9f68-4818d419f079@redhat.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABtCREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT6JAlgEEwEIAEICGwMFCQlmAYAGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl3pImkCGQEACgkQTd4Q
 9wD/g1o+VA//SFvIHUAvul05u6wKv/pIR6aICPdpF9EIgEU448g+7FfDgQwcEny1pbEzAmiw
 zAXIQ9H0NZh96lcq+yDLtONnXk/bEYWHHUA014A1wqcYNRY8RvY1+eVHb0uu0KYQoXkzvu+s
 Dncuguk470XPnscL27hs8PgOP6QjG4jt75K2LfZ0eAqTOUCZTJxA8A7E9+XTYuU0hs7QVrWJ
 jQdFxQbRMrYz7uP8KmTK9/Cnvqehgl4EzyRaZppshruKMeyheBgvgJd5On1wWq4ZUV5PFM4x
 II3QbD3EJfWbaJMR55jI9dMFa+vK7MFz3rhWOkEx/QR959lfdRSTXdxs8V3zDvChcmRVGN8U
 Vo93d1YNtWnA9w6oCW1dnDZ4kgQZZSBIjp6iHcA08apzh7DPi08jL7M9UQByeYGr8KuR4i6e
 RZI6xhlZerUScVzn35ONwOC91VdYiQgjemiVLq1WDDZ3B7DIzUZ4RQTOaIWdtXBWb8zWakt/
 ztGhsx0e39Gvt3391O1PgcA7ilhvqrBPemJrlb9xSPPRbaNAW39P8ws/UJnzSJqnHMVxbRZC
 Am4add/SM+OCP0w3xYss1jy9T+XdZa0lhUvJfLy7tNcjVG/sxkBXOaSC24MFPuwnoC9WvCVQ
 ZBxouph3kqc4Dt5X1EeXVLeba+466P1fe1rC8MbcwDkoUo65Ag0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAGJAiUEGAECAA8FAlXLn5ECGwwFCQlmAYAACgkQTd4Q
 9wD/g1qA6w/+M+ggFv+JdVsz5+ZIc6MSyGUozASX+bmIuPeIecc9UsFRatc91LuJCKMkD9Uv
 GOcWSeFpLrSGRQ1Z7EMzFVU//qVs6uzhsNk0RYMyS0B6oloW3FpyQ+zOVylFWQCzoyyf227y
 GW8HnXunJSC+4PtlL2AY4yZjAVAPLK2l6mhgClVXTQ/S7cBoTQKP+jvVJOoYkpnFxWE9pn4t
 H5QIFk7Ip8TKr5k3fXVWk4lnUi9MTF/5L/mWqdyIO1s7cjharQCstfWCzWrVeVctpVoDfJWp
 4LwTuQ5yEM2KcPeElLg5fR7WB2zH97oI6/Ko2DlovmfQqXh9xWozQt0iGy5tWzh6I0JrlcxJ
 ileZWLccC4XKD1037Hy2FLAjzfoWgwBLA6ULu0exOOdIa58H4PsXtkFPrUF980EEibUp0zFz
 GotRVekFAceUaRvAj7dh76cToeZkfsjAvBVb4COXuhgX6N4pofgNkW2AtgYu1nUsPAo+NftU
 CxrhjHtLn4QEBpkbErnXQyMjHpIatlYGutVMS91XTQXYydCh5crMPs7hYVsvnmGHIaB9ZMfB
 njnuI31KBiLUks+paRkHQlFcgS2N3gkRBzH7xSZ+t7Re3jvXdXEzKBbQ+dC3lpJB0wPnyMcX
 FOTT3aZT7IgePkt5iC/BKBk3hqKteTnJFeVIT7EC+a6YUFg=
Organization: Red Hat GmbH
Message-ID: <7a20ff91-5117-bf74-0d25-3d5fd196d6c4@redhat.com>
Date: Thu, 27 Feb 2020 10:06:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <399dfb54-62b7-945b-9f68-4818d419f079@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: zhang.zhanghailiang@huawei.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 euler.robot@huawei.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W1Cbk+E+ivwm

On 27.02.20 09:55, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/27/20 9:41 AM, David Hildenbrand wrote:
>> On 27.02.20 03:50, Pan Nengyuan wrote:
>>> This patch fix memleaks when we call tests/qtest/cpu-plug-test on s390x=
. The leak stack is as follow:
>>>
>>> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>>>      #0 0x7fb43c7cd970 in __interceptor_calloc (/lib64/libasan.so.5+0xe=
f970)
>>>      #1 0x7fb43be2149d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>>>      #2 0x558ba96da716 in timer_new_full /mnt/sdb/qemu-new/qemu/include=
/qemu/timer.h:530
>>>      #3 0x558ba96da716 in timer_new /mnt/sdb/qemu-new/qemu/include/qemu=
/timer.h:551
>>>      #4 0x558ba96da716 in timer_new_ns /mnt/sdb/qemu-new/qemu/include/q=
emu/timer.h:569
>>>      #5 0x558ba96da716 in s390_cpu_initfn /mnt/sdb/qemu-new/qemu/target=
/s390x/cpu.c:285
>>>      #6 0x558ba9c969ab in object_init_with_type /mnt/sdb/qemu-new/qemu/=
qom/object.c:372
>>>      #7 0x558ba9c9eb5f in object_initialize_with_type /mnt/sdb/qemu-new=
/qemu/qom/object.c:516
>>>      #8 0x558ba9c9f053 in object_new_with_type /mnt/sdb/qemu-new/qemu/q=
om/object.c:684
>>>      #9 0x558ba967ede6 in s390x_new_cpu /mnt/sdb/qemu-new/qemu/hw/s390x=
/s390-virtio-ccw.c:64
>>>      #10 0x558ba99764b3 in hmp_cpu_add /mnt/sdb/qemu-new/qemu/hw/core/m=
achine-hmp-cmds.c:57
>>>      #11 0x558ba9b1c27f in handle_hmp_command /mnt/sdb/qemu-new/qemu/mo=
nitor/hmp.c:1082
>>>      #12 0x558ba96c1b02 in qmp_human_monitor_command /mnt/sdb/qemu-new/=
qemu/monitor/misc.c:142
>>>
>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>>> ---
>>> Cc: Richard Henderson <rth@twiddle.net>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>> Cc: qemu-s390x@nongnu.org
>>> ---
>>> v2->v1:
>>> - Similarly to other cleanups, move timer_new into realize(Suggested by=
 Philippe Mathieu-Daud=C3=A9)
>>> v3->v2:
>>> - Also do the timer_free in unrealize, it seems more balance.
>>> ---
>>
>>
>> As I already said, I think this is init and not realize stuff. Do we
>> have a convention now and documented that?
>=20
> The clearer doc I read so far is this post:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg680187.html
> (but see the thread for more helpful comments)
>=20
> Another thread that you might find interesting is "how to handle QOM=20
> 'container' objects whose contents depend on QOM properties?"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg511703.html
>=20
>>
>> Anyhow, I don't really care
>> [...]
>=20
> Well, looking at the time spent on these series and their review, having=
=20
> it better documented might save time the whole community.

Thanks for the pointers. Yes, we should document that. Especially if it
might save me some time ;)

Moving stuff around without a clear convention is not-so-nice IMHO.

--=20
Thanks,

David / dhildenb

