Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1252776lff;
        Tue, 10 Aug 2021 05:03:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3kcJXgJal8lMd18c+8+IzN+7h11jQaJKVc96YAjye+8aPfsIlKIQu2z+dLDDUn8MHnqe/
X-Received: by 2002:a50:c88d:: with SMTP id d13mr4390861edh.334.1628597031872;
        Tue, 10 Aug 2021 05:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628597031; cv=none;
        d=google.com; s=arc-20160816;
        b=aI1+arf1KuL99NtT3ALtuQtCiMaeDFdy75mpTO9jTnO+ZcVhEtoYAR2oLtyW5fAJQz
         dxcUpsoa3+9jfB+6Qas60n2ibz3Z5/5Nc8qKn+s9ChrcQtY/op3s5O72690RYrOdjlYx
         1qvxhILHeJWDJOpOyOj5MohnPsslIkde8tBqmk0VXBUxAK/XC50/o6hbamMB5dlSGUxs
         CAr3gBCV48AOguJTtpl5Y34gqI5Eu6DfNB8UuL+uPM2KMX7HnLUt0t5CG9ZELlhyFDUl
         tU1zTTQ8IxQRlVJhM2ndEVyWTQ210/TKN4ACE4LZdTAj0Le6Kui62rtObkSFbsvo5ZRR
         Jdkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:to:from
         :dkim-signature;
        bh=8yJTX7eNzzbNaJggB4MTVcWm01xc/Rs3c9Spl2Cmkgo=;
        b=CyhR/GwuRT7uB23/iQD4oj7sjPBH+t4bFcr0+WadUrfbQXY7W2e+eLyrp0sBAaauAy
         Oeb5oTHsvrvqj/OSiY8bw+OQT6Io4rHn7fn85Ry88DLbsJ+zw3f0Pp0a4spDucmttLZd
         PLCYDXlJcMiN2+oTjyZb6aKDcMjUV3grYJ8YbbO7lcE8JZNz2USBWCgUOWX4SkladN6Q
         O76n8t3TqNOnklWietiL5fa1KnWx9Xo7QKmmMwExsguBFIFVKOgrAlSdR+Tf6AzMez5h
         IAqpKyO93eccQHbF1cf9+M5IdGny/YvD4z7h2uP9t9EPFL/4862gaGuW1E+bxbpBIg4E
         VR9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FPa7X9IV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ht8si19525275ejc.381.2021.08.10.05.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Aug 2021 05:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FPa7X9IV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mDQU2-0003lJ-Ub
	for alex.bennee@linaro.org; Tue, 10 Aug 2021 08:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQS5-0001EJ-M9
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 08:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mDQS1-0004qh-Tb
 for qemu-arm@nongnu.org; Tue, 10 Aug 2021 08:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628596904;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=8yJTX7eNzzbNaJggB4MTVcWm01xc/Rs3c9Spl2Cmkgo=;
 b=FPa7X9IV/PQ9vwUG/+HHosiGO6Uz5j9T9EheWB+kZqkxgvhfKNipd/NrNY7U5RYvKiYSWm
 Oi5gZglqB5qPZxeZnN2l2jHY8Ev/5zbNjbhT7iDPYcHZ3gfUAVhI2itpb7j+Y06zU8BTJG
 Rq0qKQdNTX6Xah804hOsB9HYrmR/r1A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-Z-ZKJZ4sOuGDJaTPjDWYbA-1; Tue, 10 Aug 2021 08:01:43 -0400
X-MC-Unique: Z-ZKJZ4sOuGDJaTPjDWYbA-1
Received: by mail-wr1-f69.google.com with SMTP id
 o4-20020a5d47c40000b0290154ad228388so6291129wrc.9
 for <qemu-arm@nongnu.org>; Tue, 10 Aug 2021 05:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=8yJTX7eNzzbNaJggB4MTVcWm01xc/Rs3c9Spl2Cmkgo=;
 b=rGrd5ZjRlmYOjPKgBHD7orP1I1ghidCYM9m2AHsYF6Ys6O22M+hSisCG2t+Uylyb3P
 h6/zb7H8E1y3hOaVafE0qZIqQ4enhJlMW0E7OlIeZEz1ZyhNoS2HFK6FvnruzrORkBzi
 gi/Mn7wZzK8jhRwTeT/E03rvhfpUOX+ucMYZ8a3nD6UqE1PaN9/UAktL/2gvEYuCmjhO
 crbaaGg8PESCY1yRgl7wQCAvNFzKLE3uOzNTaIi1lF6MxuqH33iLJSlki7g9jnlkNjS/
 bzFfBDbJKVtIKc2mOMU4c/POgxI4W1+md2XXu5FU2K0joxnUs5LyFtaLIvCq5FZUnwwk
 4YWw==
X-Gm-Message-State: AOAM530erXttHAM4k3vHg0S4xb1y7xrm6YYVtYaF7enSoatwX3jiJA8c
 1ai0GjN0nGz16w4bSruqlmMTAtuqDrlldJrBdDqlKEhtLXERcHxdtljZ5fUsNPNUE/Bw26WbwwM
 goV8OvtaVLnrF
X-Received: by 2002:a5d:658a:: with SMTP id q10mr30910133wru.343.1628596902472; 
 Tue, 10 Aug 2021 05:01:42 -0700 (PDT)
X-Received: by 2002:a5d:658a:: with SMTP id q10mr30910057wru.343.1628596902136; 
 Tue, 10 Aug 2021 05:01:42 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id j4sm20637348wmi.4.2021.08.10.05.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 05:01:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH for-6.2 05/12] [automated] Move QOM typedefs and add
 missing includes
In-Reply-To: <20210806211127.646908-6-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Fri, 6 Aug 2021 17:11:20 -0400")
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-6-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 10 Aug 2021 14:01:40 +0200
Message-ID: <877dgt1paz.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.704, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Andrew Jeffery <andrew@aj.id.au>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Vijai Kumar K <vijai@behindbytes.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Corey Minyard <minyard@acm.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9?= =?utf-8?Q?dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>, qemu-riscv@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathi?= =?utf-8?Q?eu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yXyGFSzewxk3

Eduardo Habkost <ehabkost@redhat.com> wrote:
> Some typedefs and macros are defined after the type check macros.
> This makes it difficult to automatically replace their
> definitions with OBJECT_DECLARE_TYPE.
>
> Patch generated using:
>
>  $ ./scripts/codeconverter/converter.py -i --pattern=MoveSymbols \
>     $(git grep -l '' -- '*.[ch]')
>
> which will:
> - split "typdef struct { ... } TypedefName" declarations
> - move the typedefs and #defines above the type check macros
> - add missing #include "qom/object.h" lines if necessary
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Just curious, how did my name ended on the CC'd list?  I don't see any
file that I touched or that is migration related.

Later, Juan.

