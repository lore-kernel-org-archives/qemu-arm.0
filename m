Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5976532lfg;
        Wed, 3 Mar 2021 22:16:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwA7x1h0qD0/mJ7mHosnZJJfPctlLHWL0WcC0L2BSfpDa/3ZxZ+FUN/l5ldc/cbc6pcuR0b
X-Received: by 2002:a6b:7619:: with SMTP id g25mr2497770iom.177.1614838594837;
        Wed, 03 Mar 2021 22:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614838594; cv=none;
        d=google.com; s=arc-20160816;
        b=BqsHb6NL4c4dqpVXf5tlGTMYNUI293NgB9Soma/pReiEJBdGq+pdzYyRNq0Ezc7Jjo
         Wyb2FA+GmROkBBK+rCKeMuOWYVDeeRY4h2AXTmbPFceZeFvK35Llm+/iMFDOS9dPLdZ6
         T2R7yOYHPRrx0UifwSeNvpA3J8oQ9YeInLei8SlWJondOpBGVenufE0pr15Nnzt/Ijk3
         iAR8kxmQuVdBv9djO+d7KbKiu9SMkvMCp4VFlI43E1dAwelh+s6k6pUpcmWp464rKSSp
         SOpvbejAKUSECqQN1jx8FkAxzvICVdrkGFFUft4N8JwYtHTkTbZIxrrlf9QOoqSNDTk6
         WWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+c2QbpBZhD/X5mAE4tIw2s+mvf1Xr2Z7syEFQgdlVK8=;
        b=uxLa1R1fUlSRSto2qduV70iaaaPrJnIBgxsJ1cCDH5+Aqhc+9a8B9n8W1KxbToMoEs
         rE0412iBeQ2197a6H6elMEz4/fsiey5UfqwilFfWVBB0YgzkZB/Gr75BtgwS9JtyIPD7
         HFODjdvwyEoCOQNtvRIWITMkHoRoxJav+akX1cX4kkrJ5L53LFaaOCusB4EKYrhvg6gA
         1BXKdPr7XZMandLVTdcNL6g0dXYYaWsrx9gKLkrBozJdVkZAayrabWqILicRs6Y5KB61
         S41bhwktQ6nzleHFRl4UM/v4B6MyJd6iN3+b0AOkWGvnO3HfWzMCrvPViSOta/r+wOjo
         rPtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D+WBl7ue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6si26863960ila.108.2021.03.03.22.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 22:16:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D+WBl7ue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHhHm-0006nl-5m
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 01:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHhHb-0006iu-29
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 01:16:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHhHU-00020B-I6
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 01:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614838557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+c2QbpBZhD/X5mAE4tIw2s+mvf1Xr2Z7syEFQgdlVK8=;
 b=D+WBl7uees6QsQa6+uHizDMvQ11x7tsU4vLdeJnNWzKsqUFKINk39JJS0HQLRoLATVzNLs
 RkYmL8zSiF9d8Zs/CuxE51jFoZDIFWKowBMdAClP34ZfmsrCuqNzvtB/6f+FDj9jEj/G8d
 7K6g3nnBJmUctuFLTwWMD6cIt/IWyM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-EzAsdx2aMJasx3nGrADMdQ-1; Thu, 04 Mar 2021 01:15:54 -0500
X-MC-Unique: EzAsdx2aMJasx3nGrADMdQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EABF580196E;
 Thu,  4 Mar 2021 06:15:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 628361F434;
 Thu,  4 Mar 2021 06:15:33 +0000 (UTC)
Subject: Re: [RFC PATCH 6/7] cpu: Move CPUClass::has_work() to TCGCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210302102737.1031287-1-f4bug@amsat.org>
 <20210302102737.1031287-7-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dfda927b-8937-afe2-f853-5c9817499c4a@redhat.com>
Date: Thu, 4 Mar 2021 07:15:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302102737.1031287-7-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X1tvUzd75qXg

On 02/03/2021 11.27, Philippe Mathieu-Daudé wrote:
> We can only check if a vCPU has work with TCG.
> Restrict the has_work() handler to TCG by moving it to
> the TCGCPUOps structure, and adapt all the targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC: PPC target incomplete
> ---
[...]
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 00330ba07de..3110867c3a3 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -261,11 +261,6 @@ static void cpu_common_reset(DeviceState *dev)
>       }
>   }
>   
> -static bool cpu_common_has_work(CPUState *cs)
> -{
> -    return false;
> -}
> -
>   ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
>   {
>       CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
> @@ -397,7 +392,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
>   
>       k->parse_features = cpu_common_parse_features;
>       k->get_arch_id = cpu_common_get_arch_id;
> -    k->has_work = cpu_common_has_work;
>       k->get_paging_enabled = cpu_common_get_paging_enabled;
>       k->get_memory_mapping = cpu_common_get_memory_mapping;
>       k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;

cpu_common_has_work() is gone without replacement? Can you be sure that the 
pointer in tcg_ops is always initialized? If so, could you please add a 
comment to the patch description?

  Thomas

