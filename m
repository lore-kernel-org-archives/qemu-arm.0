Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp824194lfp;
        Tue, 14 Sep 2021 09:06:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyknw2Jy//q7ZxD2uLp6Ci8mXpfKfsJE/I/cXWKekc33a3dxK60xtUy0Cd6k8xI49lXCHVw
X-Received: by 2002:a1c:398a:: with SMTP id g132mr3073277wma.125.1631635608120;
        Tue, 14 Sep 2021 09:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631635608; cv=none;
        d=google.com; s=arc-20160816;
        b=UHcMm6qFUaGs8/nKyh4dOS7kzSy5g3gsm7ucpSuQhEHJovtD4betKQsFgnzb2ZDKP7
         gtiI1sKv+WKC0ap3MCuqDGnQ5aawTt26vciKYHZv9OFcK0dcm9tI1Iqf9d7QHhPfI+Wv
         mP+/4rBp2vYT+CzGJbVSurCAm8wzmzUOLXM0ccG9BeX3knkwEw0boN+Q5JVp5n2vPbe9
         dFsJsLovCHF0QIUdOY/522hXlhODFuodLBlWTBHHL3PxnrCoLds7uf1DDMinRR8Gz6XC
         snaw0/sNuFh4D/MhwbfG1RQTAeOdNd6zmrzjOVY8KQCzWNp6J76euBeNV7UGYq9hPFvS
         ZWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6hUwwzfi7ZCFW20LiJr9iIjQbHTM6ICVlhLWMEND5eY=;
        b=d9ZFdCqWTx65K9Yyl8nGRywq//Gvuk05FhFCVlVtpi1be1DiOuSRpnZPqob7FNGcSi
         bN20cPugDpdTD4feLVIgWdycq5Vq7jGx6Rr0lYExhb8larGEMJI1ZC3h0qb7z/72bJag
         PCe/xPZrhv8NR7om9WR5INdztOrAowEuhxf2dCegc62Xu7r6Yv84r8dmJ6UeG1kBM0lV
         +P7UdDZw+nnX6kog4axr8/N5RSNpLptHftoefMIq2/l5JRlWU+gWCNvUCTgteoJJht+s
         OWp5ykTqbIuwzYCyLDa0rkFafxP9EJyd+wwd2ElxkV4abBWwBukC1D8fyIhokFS/yOkp
         YRUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="e/1HWJ/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si1749479wmr.30.2021.09.14.09.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 09:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="e/1HWJ/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQAxJ-0005HN-TT
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 12:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAkg-0002T3-8S
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 11:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQAkd-0003nQ-5V
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 11:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631634818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hUwwzfi7ZCFW20LiJr9iIjQbHTM6ICVlhLWMEND5eY=;
 b=e/1HWJ/z1BmKmu+Ug+4ArauLtAHt7LwlblHOyHD0Dj0uEVzuEWgZaiW4OSCpLe61VKpOUB
 DcpR52Hl6SzPRwFernY2K16mteLUINI5arKvVZ7G68vJno8VXg13yuyFJV5f4JQv0K8W9o
 2EBngmQdpI43uMfFetckHJ0roc7lRFs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-exb-mrUmP-azXggmsqJMPw-1; Tue, 14 Sep 2021 11:53:35 -0400
X-MC-Unique: exb-mrUmP-azXggmsqJMPw-1
Received: by mail-wm1-f71.google.com with SMTP id
 a144-20020a1c7f96000000b002fee1aceb6dso6657243wmd.0
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 08:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6hUwwzfi7ZCFW20LiJr9iIjQbHTM6ICVlhLWMEND5eY=;
 b=5OruWUy0Dg7meC0Of0KG/a7kcgj2XBMMTULnPc8XMS0LmoBtGgJFP+92FP5np6KhwY
 4+RtFpYVGq0FTcNhLH/2uTNKbA1Nd2k5vLqsriXIvH/AQ+LeS0YzvQNisVOwbp3j5UUb
 asMdCU/ptwMSVlBo9Iu+7Sj23mupC1mMxwJcQOX+oZZhrjmI7MtesAbx/SehI9rAYbP/
 +RDXO+BrOYBkHEEEMSbmoz+Th0vsuE1KV15MmlzgcBCkNW1cXb4s2xPRtsQ4MsagjL23
 xUBfnO6UmBI9iehRFy3R9Gu+R+HR50Or7zT0qNYJi1ErVg60M/KNlBRaNdimmi7MLpyL
 r/Ww==
X-Gm-Message-State: AOAM531dBiHrBCt9xv31FwTC27MgakjhvzBS4D+NK+8s3fanRYxiQaON
 d7vD2PAnHgoc+qtY2FSMpi0QtZFNh+WHq8bOeoK2GNFpiQ6kvwAiOdxyy2eouYEuEsz8umhRtvf
 eQXc38nnVrSPM
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr19252680wrw.311.1631634814300; 
 Tue, 14 Sep 2021 08:53:34 -0700 (PDT)
X-Received: by 2002:a5d:63d2:: with SMTP id c18mr19252627wrw.311.1631634814088; 
 Tue, 14 Sep 2021 08:53:34 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id a10sm10977861wrd.51.2021.09.14.08.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 08:53:33 -0700 (PDT)
Subject: Re: [PATCH v2 06/53] hw/core: introduce 'format_state' callback to
 replace 'dump_state'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-7-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3ad4843-02dd-380e-a09b-91c80a25b052@redhat.com>
Date: Tue, 14 Sep 2021 17:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-7-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FFRF1DSP3rEn

On 9/14/21 4:19 PM, Daniel P. Berrangé wrote:
> The 'dump_state' callback assumes it will be outputting to a FILE
> object. This is fine for HMP, but not so useful for QMP. Introduce
> a new 'format_state' callback that returns a formatted GString
> instead.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/core/cpu-common.c  | 15 +++++++++++++++
>  include/hw/core/cpu.h | 13 ++++++++++++-
>  2 files changed, 27 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

