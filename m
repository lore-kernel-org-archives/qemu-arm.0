Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp3886229wri;
        Mon, 4 Nov 2019 04:01:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxrmn61ZdPeYUAspfnYtiD+O1sbjekPa2PyV4D6BVDR4mWsuBYpsnXZ4QazAOStsWtMtuMm
X-Received: by 2002:a50:91c4:: with SMTP id h4mr28986111eda.36.1572868904258;
        Mon, 04 Nov 2019 04:01:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z44si7778445edz.211.2019.11.04.04.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2019 04:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="QaE//GrR";
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRb3H-0001Qk-0C
	for alex.bennee@linaro.org; Mon, 04 Nov 2019 07:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37603)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iRb2n-0001QO-2J
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 07:01:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iRb2l-0007lf-O0
 for qemu-arm@nongnu.org; Mon, 04 Nov 2019 07:01:12 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:41256)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iRb2l-0007ic-8s; Mon, 04 Nov 2019 07:01:11 -0500
Received: from [172.16.11.102] (crumble.bar.greensocs.com [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 5E18496EF0;
 Mon,  4 Nov 2019 12:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1572868865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Ze2mKNbmdnrfOAKSXjH+RHL1wUmdmo8i3y7JYnOqjE=;
 b=QaE//GrRgn5WcHw6d93rEhXjyCafulEvFTU6+9eU+YUjng+aDjbqMLpfKQ5qd+wV4mu1hi
 JbGRGvFru13c7GGV4dz+PrAnLGMiQnT4IIhfZRQA3+fRHMrIjYtHAc7JkM9Y5+LlM36UCb
 zqFj28UUmiomRgh935WJpcpV5zZeUCs=
Subject: Re: [PATCH v5 08/13] hw/core: deprecate old reset functions and
 introduce new ones
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-9-damien.hedde@greensocs.com>
 <41ee0633-c8c8-10ce-1372-4804f25273d0@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <b434efd9-490a-85f4-9f22-c40bb0a9ed77@greensocs.com>
Date: Mon, 4 Nov 2019 13:01:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <41ee0633-c8c8-10ce-1372-4804f25273d0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1572868866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Ze2mKNbmdnrfOAKSXjH+RHL1wUmdmo8i3y7JYnOqjE=;
 b=EDDoZbQ6fDb4lTp+EfTT81aPBI/OwCrn66UU9xGbAM6+3Rvp98U2l4PxjHS9HFhIKukMqc
 pLFwUwVQGgVVzye9PV898DXoW5XfXePK2S1KKfv8p1lg533u0BuGTqD1KED7aJPKDmllQB
 0nQnM+F8YP5nS4EA7gNovyk/8drNzhk=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1572868866; a=rsa-sha256; cv=none;
 b=F38cMoNJhVVF8fLejTeFLX+V7qzeH6dP7f3eufb92pJkZ2qWfoPiL5+PW5+p9eTtMHdrt7
 aZeuiWxN4kvxJa7p8BPFo1xO9J39T4pAxCv1zSVQWd0Yj5jxBnVAeRmCC4nqN3ZubnGP7F
 GqMORqvWp2Td6gBLb5wSPnM8F4gEyTY=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-s390x@nongnu.org,
 edgari@xilinx.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V46lmE1DflJ9



On 11/1/19 12:35 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/18/19 5:06 PM, Damien Hedde wrote:
>> Deprecate device_legacy_reset(), qdev_reset_all() and
>> qbus_reset_all() to be replaced by new functions
>> device_cold_reset() and bus_cold_reset() which uses resettable API.
>>
>> Also introduce resettable_cold_reset_fn() which may be used as a
>> replacement for qdev_reset_all_fn and qbus_reset_all_fn().
>>
>> Following patches will be needed to look at legacy reset call sites
>> and switch to resettable api. The legacy functions will be removed
>> when unused.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> ---
>> [...]>> =C2=A0 +void resettable_cold_reset_fn(void *opaque)
>> +{
>> +=C2=A0=C2=A0=C2=A0 resettable_reset((Object *) opaque, RESET_TYPE_COL=
D);
>=20
> Why not take a Object* argument?

This function is used to register a reset callback with
qemu_register_reset() (path 10 and 11), so we need void* to match the
prototype.


