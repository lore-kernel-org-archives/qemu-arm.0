Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2431405wrq;
        Mon, 9 Jul 2018 06:20:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpewAELDXa1oQ1/A+h08Mq33lM454W3LpGRu9Uj5bB/Pd+8UcMKLMU4W8PCPw1/oH7DoDnUM
X-Received: by 2002:a37:28c4:: with SMTP id o65-v6mr17613107qko.251.1531142411207;
        Mon, 09 Jul 2018 06:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531142411; cv=none;
        d=google.com; s=arc-20160816;
        b=swmcHym+g9t/S8ShNvmXXmfR4LLh+VB0ur3Eaz3laH9FktWstSZSkfFqvGujmDk3Xq
         kJITg3hrAEuKVM/KjOk3Bz7VL9WaO/LUPNF0im4syRxdjGaqEH/jhr2CFb7hmx4OqBMM
         JTtTa4uFvvwaTsZN9916fgnN3xGxnf7KWveIbuZO4Jk1MIhKhhD0Uz3wXNMLTzPbhLrm
         r5ArtgjumS85lkilBYznFvJRwdC1ChIgiyNqfKkvj6M8+qyp5oki2+iordjpgQIHi2h8
         J1DITSYFVs/vdub5aHZAb0s/PCh8O4TlsEmzlyzMGiAnDfHpZtBvS4DI5GigwSpcSUo5
         Icvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=Es2hItFbm8jwdlar51wQEYL8C/lM4nHt0n4NSu6Sras=;
        b=RaboxH+SFwdl5QKUzZBeM6zdhijY4KLSylWz/HOrJSAQgrjBu33OBMvqYOoYAw+oum
         vyNTtKEwHXMaElfPHWwWvGZAjQfDx/5S2ljdJL7m3hMRu67eq+5853Jt08KjrCh/RfRn
         jwqmLJLmXWF93zoMowjdZODsk1qsue5DfPtkPnAXHSBZMHb+YLEQKYvUW7Bpn4RuWN1U
         VKLLLN994Lvkq4SK5epVVRQuqO20Qc/oyTYuM6vZ0wDfiIeGEpugGgTGKXaur+DPzRfm
         Tr1A/6plxiBjRe3fG6K2B6+tWtzx1VlbEDQZHxsWvnPua+ZZPQalQ/xfRlWxGvzqjh4t
         aFbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c40-v6si6124273qtb.208.2018.07.09.06.20.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 06:20:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcW5K-0003gj-NS
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 09:20:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fcW3X-0002ZN-So
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 09:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fcW3U-0003Uh-Mi
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 09:18:19 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43222 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1fcW3U-0003UV-FI; Mon, 09 Jul 2018 09:18:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 050467CBBA;
	Mon,  9 Jul 2018 13:18:16 +0000 (UTC)
Received: from [10.36.118.52] (unknown [10.36.118.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6D2B111E3FE;
	Mon,  9 Jul 2018 13:18:14 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180702130605.13611-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <3efdfd1a-2f68-f844-a0c1-10f2430309bb@redhat.com>
Date: Mon, 9 Jul 2018 15:18:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180702130605.13611-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 09 Jul 2018 13:18:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 09 Jul 2018 13:18:16 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-3.0] boards.h: Remove doc comment
 reference to nonexistent function
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <huth@tuxfamily.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZxnWFOZfQRuo

On 02/07/2018 15:06, Peter Maydell wrote:
> commit b08199c6fbea1 accidentally added a reference to a doc
> comment to a nonexistent memory_region_allocate_aux_memory().
> This was a leftover from a previous version of the patchset
> which defined memory_region_allocate_aux_memory() for
> "allocate RAM MemoryRegion and register it for migration"
> and left "memory_region_init_ram()" with its original semantics
> of "allocate RAM MR but do not register for migration". In
> the end we decided on the approach of "memory_region_init_ram()
> registers the MR for migration, and memory_region_init_ram_nomigrate()
> is a new function which does not", but this comment change
> got left in by mistake. Revert that part of the commit.
> 
> Reported-by: Thomas Huth <huth@tuxfamily.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Doesn't strictly need to go into 3.0, but it's a trivial
> doc comment fix...
> 
>  include/hw/boards.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 79069ddcbec..d139a431a67 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -35,8 +35,7 @@
>   *
>   * Smaller pieces of memory (display RAM, static RAMs, etc) don't need
>   * to be backed via the -mem-path memory backend and can simply
> - * be created via memory_region_allocate_aux_memory() or
> - * memory_region_init_ram().
> + * be created via memory_region_init_ram().
>   */
>  void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
>                                            const char *name,
> 

Sure, it's just a doc fix.

Paolo
