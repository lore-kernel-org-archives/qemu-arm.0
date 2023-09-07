Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp167249ejb;
        Thu, 7 Sep 2023 01:20:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzjmdEFqKLL0UgpueNleXSwlK9bLf9UeQufhHXqUBRCM5G/+RnJGXARP8A+2gF5r705eXe
X-Received: by 2002:a05:620a:15ac:b0:768:efd:2685 with SMTP id f12-20020a05620a15ac00b007680efd2685mr18736186qkk.33.1694074846305;
        Thu, 07 Sep 2023 01:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694074846; cv=none;
        d=google.com; s=arc-20160816;
        b=KhogePhfYe0hWUGpivTDFXY0T2yOY6jeJkpuFrqrJDgBoK2L4cxM4iIlEP3P6VeQXf
         PEhrrzwE+niEvJnjrPk0UjvxN5BOuouyBKW7TxEkux/iihytRj8FvmQO2bfADN1FwfMG
         dFztstUff+hBGBjUAsKOXDQQH1+i/B7zv8bfNxBmI4Gv5hIp2/0uT1uoKN8xtUa2QaH1
         dSNmSGQxwO6HH4Je/gMnyjcq0BRDQwFBb5tBXTY5LKov3aPKnnfcSggu1cGUD/v1si4I
         O+xmypIna00KmDPyxgfiDDKLPleelmkWbnmAQZlR5wpd1rmhbYMSc6dq1FHEGgeOvMa5
         hLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=F2OyX/4vicH8Ymp1kGXt6T0QEQRWRB432IzgFJXDEm0=;
        fh=U+TEyw3SxshrYvlghAsQlvHYs2kdRHufacTtkrnNQZQ=;
        b=J0K2sHoAQM+VI8CMhy7Zx5BbcdTpkpUdz8jorxrWRgwlAWXYJ3+T/4NOwwl4fGagMh
         Mz8CSmTdQwgpctpfxa2g80s/o5A839RtwRPFtCkUJCirXINsLWw4Ldlhpda3Hqrkw5Ap
         pn3cVWAf8pPhM2QNXZcvWsIXAqOM627PH0ULUMeVhJHNuAfW7JLNhKRvJlSLJXpY1w2p
         dlbaYIR0TTx+PSOJ4UpN/63sWCdDfZ/pMT2oaQHQL6RjNAbPimJe2OJvdsItbOjJ2/8t
         YAo7Ucqtll+bj69/heHLUngo610mmL6F2Spk1N7MdMnuB9DkkIDLeImCmd1ITRaJr798
         6ScA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MDjto5Fo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a05620a204a00b0076ccd28e142si10188681qka.231.2023.09.07.01.20.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 01:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MDjto5Fo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeAFT-0005uf-J7; Thu, 07 Sep 2023 04:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qeAFT-0005uG-0W
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 04:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qeAFQ-0006Na-Oy
 for qemu-arm@nongnu.org; Thu, 07 Sep 2023 04:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694074819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2OyX/4vicH8Ymp1kGXt6T0QEQRWRB432IzgFJXDEm0=;
 b=MDjto5FoP5SUztdkQ++2Es+Xbj9RPynsJGgjNxnYK2kf04RaMWeX18F4igKAgzHAe9kcyg
 0AcZvxdtD2FF+kW0y7Qk8XC/C9vRAdQp//9kyHwyFu4YAUGwxGhwZul0+DixxndVermMXr
 JscFmdVOm9Ms6E/KXeS9XfXdx6ehhKI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-eYj4-ubyMqS_6HAeCG2MfA-1; Thu, 07 Sep 2023 04:20:18 -0400
X-MC-Unique: eYj4-ubyMqS_6HAeCG2MfA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31aecb86dacso450541f8f.1
 for <qemu-arm@nongnu.org>; Thu, 07 Sep 2023 01:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694074817; x=1694679617;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2OyX/4vicH8Ymp1kGXt6T0QEQRWRB432IzgFJXDEm0=;
 b=SZ19S2y3pHgcq080URRyAoD5k2DefTMfGjgYdlgoT6lacKlLBwyU9VZ+xl24rc0iO1
 PHw0Fjx63HZrmAMwmsAwvzjezmGyQ5ag9HmsejHJjPpi2RYqcabIxbd7AbWav5N+XHaY
 GHEOIiLUlM7sOj+YpF4QFgwrHjVeZ6lTPFnNdV9a5sMCRIbjcJX9okIjQfs4hezlaxCy
 R9TsaOOSa1UciDOO48ducWYpaU86PgMGanafKuY6e0atyS0xEUvE0XtTabdzNSCNWK2I
 AbPeSDcW0k8yt3bec674j0bEhSZBs+rSXMX37hPF4bx0b9Jexpn4j6TcG6hT6umZUcUi
 OUSg==
X-Gm-Message-State: AOJu0Yz4lmPc0veYhD+YtZNsQj+BSUJg8LvYA3lDo7lDXGOBjZKrz9Hi
 axHmdR69DOUQ1IVg079OAVxK9A0vXWZ486bFgJHJsKN2AsxGTPuqj71EFgrkelsuj9QSrNjPmLV
 gH9Jny9YLqK8V
X-Received: by 2002:a5d:564c:0:b0:31c:8b99:47bf with SMTP id
 j12-20020a5d564c000000b0031c8b9947bfmr4064021wrw.41.1694074817244; 
 Thu, 07 Sep 2023 01:20:17 -0700 (PDT)
X-Received: by 2002:a5d:564c:0:b0:31c:8b99:47bf with SMTP id
 j12-20020a5d564c000000b0031c8b9947bfmr4063983wrw.41.1694074816836; 
 Thu, 07 Sep 2023 01:20:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c711:cb00:d8c3:e672:87cb:e4d9?
 (p200300cbc711cb00d8c3e67287cbe4d9.dip0.t-ipconnect.de.
 [2003:cb:c711:cb00:d8c3:e672:87cb:e4d9])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a7bc414000000b003fd2e898aa3sm1315536wmi.0.2023.09.07.01.20.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 01:20:16 -0700 (PDT)
Message-ID: <698b58e2-0c41-856d-cd79-71c8d0b3ff79@redhat.com>
Date: Thu, 7 Sep 2023 10:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 15/32] target/s390x: Use generic helper to show CPU
 model names
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, imp@bsdimp.com, kevans@freebsd.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, peter.maydell@linaro.org, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org, laurent@vivier.eu,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, richard.henderson@linaro.org,
 mrolnik@gmail.com, edgar.iglesias@gmail.com, bcain@quicinc.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, crwulff@gmail.com, marex@denx.de, shorne@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 npiggin@gmail.com, ysato@users.sourceforge.jp, thuth@redhat.com,
 iii@linux.ibm.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 kbastian@mail.uni-paderborn.de, jcmvbkbc@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, shan.gavin@gmail.com
References: <20230907003553.1636896-1-gshan@redhat.com>
 <20230907003553.1636896-16-gshan@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230907003553.1636896-16-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: b3IG77K6klbB

On 07.09.23 02:35, Gavin Shan wrote:
> For target/s390x, the CPU type name is always the combination of the
> CPU modle name and suffix. The CPU model names have been correctly
> shown in s390_print_cpu_model_list_entry() and create_cpu_model_list().
> 
> Use generic helper cpu_model_from_type() to show the CPU model names
> in the above two functions. Besides, we need validate the CPU class
> in s390_cpu_class_by_name(), as other targets do.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/s390x/cpu_models.c        | 18 +++++++++++-------
>   target/s390x/cpu_models_sysemu.c |  9 ++++-----
>   2 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 91ce896491..103e9072b8 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -338,7 +338,8 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>   {
>       const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
>       CPUClass *cc = CPU_CLASS(scc);
> -    char *name = g_strdup(object_class_get_name((ObjectClass *)data));
> +    const char *typename = object_class_get_name((ObjectClass *)data);
> +    char *model = cpu_model_from_type(typename);
>       g_autoptr(GString) details = g_string_new("");
>   
>       if (scc->is_static) {
> @@ -355,14 +356,12 @@ static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
>           g_string_truncate(details, details->len - 2);
>       }
>   
> -    /* strip off the -s390x-cpu */
> -    g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
>       if (details->len) {
> -        qemu_printf("s390 %-15s %-35s (%s)\n", name, scc->desc, details->str);
> +        qemu_printf("s390 %-15s %-35s (%s)\n", model, scc->desc, details->str);
>       } else {
> -        qemu_printf("s390 %-15s %-35s\n", name, scc->desc);
> +        qemu_printf("s390 %-15s %-35s\n", model, scc->desc);
>       }
> -    g_free(name);
> +    g_free(model);
>   }
>   
>   static gint s390_cpu_list_compare(gconstpointer a, gconstpointer b)
> @@ -916,7 +915,12 @@ ObjectClass *s390_cpu_class_by_name(const char *name)
>   
>       oc = object_class_by_name(typename);
>       g_free(typename);
> -    return oc;
> +    if (object_class_dynamic_cast(oc, TYPE_S390_CPU) &&
> +        !object_class_is_abstract(oc)) {
> +        return oc;
> +    }
> +
> +    return NULL;

Why is that change required?

-- 
Cheers,

David / dhildenb

