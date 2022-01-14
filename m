Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp57379lfj;
        Fri, 14 Jan 2022 03:40:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuDSb5LeUwvuU93nt4OztgIOCWnYypU9l8keU6uTlSZhxIRZOx8tQ6bmC9iDOlkxYXJPzw
X-Received: by 2002:a25:1007:: with SMTP id 7mr11284599ybq.594.1642160437089;
        Fri, 14 Jan 2022 03:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642160437; cv=none;
        d=google.com; s=arc-20160816;
        b=tn6F4Ut8R/LwFX+65BmgjMYEbQFgc2DEaav8qOON6KEIh8SHlfDQVwA4pe/cc7vo6m
         wjJ2hMlUfOy1LSOFVk/P2/FvR8Gtchup0iiXmzrKs2kiZ3zwIoyRPmy5RGlhVpo2oVpP
         rrfJFFgO35lgufbKbkLKWxk+1CoN0rwUCJe2Pn1LKeD4H9trcleY1c4JhaON96QJYVem
         ue1Tj/si+onMPvQljc4N85HoBcCyI5cJ2AbVguauTuuH6JzD4LyYKFS8nnOH81H4mXUu
         e/sP3R8k8egg8zAuhqDWcQR9Qluw0rwfZfG9GfwavOUR4sfdWoPgNe91GFUqBuIZhmTX
         IN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=UTnbuUO9fwG0QszI/JTZU7bhP8InmHHmnDN/FBVNtWE=;
        b=IjVu72uRw/MRU4L6zyLlONQ6Lry84UpwMSZu/ggKJYmtHGmsP4FPP3kqS+3ymnvvLj
         l9gH8yPsfgV6NJbcu3M4lUVUHXTmK4lUQ8zJYt+iV6Qf+HwtWa6UDeppgd5LBTJTKPoL
         jpL7SJbyWuYgcURe4vnm9aEY6F4VRHzvXDr+HD0fJqkMCe7/ROkPG4imNYsY9BFzj5Lj
         9xRsKjrya2r2HsOMDTh43KFZ98jwuUTJ75gFWiNYpbvFhm1VLysmZ7CU390B4QCAlLQj
         hTurSeSIhU1BHf6Ihq8GqLG8SgiFdmpg+khoBVwfpw50BlYZo2rDQ5a/HsNqFOrrxkMB
         xohg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D5/6jRsT";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si4202984ybb.401.2022.01.14.03.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jan 2022 03:40:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="D5/6jRsT";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n8Kwe-0000zm-BR
	for alex.bennee@linaro.org; Fri, 14 Jan 2022 06:40:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8KrP-0006x7-NK
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:35:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8KrN-0008Mx-6T
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642160108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTnbuUO9fwG0QszI/JTZU7bhP8InmHHmnDN/FBVNtWE=;
 b=D5/6jRsTt2SObp+++9cn+/SUhvvnHenTyQMOTIFaOqA3oGJlwLdy+yf+tUAB+ipcbIyfWY
 BfL8EVQdgQRadPff23c358Ay/yDzk+T6dOsMrXOSGe+qSn2LFHLqk7w58X4iqjgInWQgRY
 iMNuINN8ipoqtUIg2gdJB7p0WbtmE3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-mUFBJW7rMm2_PeZ1Y3ENaQ-1; Fri, 14 Jan 2022 06:35:05 -0500
X-MC-Unique: mUFBJW7rMm2_PeZ1Y3ENaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D6341853020;
 Fri, 14 Jan 2022 11:35:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1C6184644;
 Fri, 14 Jan 2022 11:34:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4680E11380A2; Fri, 14 Jan 2022 12:34:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 02/14] hw/core/machine: Introduce CPU cluster
 topology support
References: <20211228092221.21068-1-wangyanan55@huawei.com>
 <20211228092221.21068-3-wangyanan55@huawei.com>
 <fa7f67b2-ca1d-bd95-1a33-534a50b2d4c8@redhat.com>
Date: Fri, 14 Jan 2022 12:34:52 +0100
In-Reply-To: <fa7f67b2-ca1d-bd95-1a33-534a50b2d4c8@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 28 Dec 2021 20:17:19
 +0100")
Message-ID: <87lezi3603.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CQDGaRdw/NgF

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi,
>
> On 12/28/21 10:22, Yanan Wang wrote:

[...]

>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index edeab6084b..ff0ab4ca20 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1404,7 +1404,9 @@
>>  #
>>  # @dies: number of dies per socket in the CPU topology
>>  #
>> -# @cores: number of cores per die in the CPU topology
>> +# @clusters: number of clusters per die in the CPU topology
>
> Missing:
>
>    #            (since 7.0)
>
>> +#
>> +# @cores: number of cores per cluster in the CPU topology
>>  #
>>  # @threads: number of threads per core in the CPU topology
>>  #
>> @@ -1416,6 +1418,7 @@
>>       '*cpus': 'int',
>>       '*sockets': 'int',
>>       '*dies': 'int',
>> +     '*clusters': 'int',
>>       '*cores': 'int',
>>       '*threads': 'int',
>>       '*maxcpus': 'int' } }
>
> If you want I can update the doc when applying.

With the update, QAPU schema
Acked-by: Markus Armbruster <armbru@redhat.com>

