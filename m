Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp533589lfg;
        Thu, 25 Mar 2021 08:43:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCn8FAZTrQv/1sDmXEMF0XzhRYQHHtgavicJxZgwPbbmANc6eMXzxJjsgiweT9WDNVhIVE
X-Received: by 2002:a92:6b0e:: with SMTP id g14mr7451563ilc.246.1616686992105;
        Thu, 25 Mar 2021 08:43:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616686992; cv=none;
        d=google.com; s=arc-20160816;
        b=Xw2ipV15k2XSg4AreTGdOJOVD2lb9n/TDGJw/nWMx49dtIhQVDYBO3Xp0q0xWgHcEC
         UnazlWdZtOrl7FS1PCUknDMWDY8Om0yMX468p9IP2ez7yYZDn3UdRY1bPNnAGWvSDv9/
         F3u/FQ6ZtRxoWMR1NALRAHFWcX3HA5d9DqFt7MbJJ0jUbwwnbQH6qqeUfrkOz2Fk1VFs
         BMbNsQbD2QisbAzUTFkTRQtDFCnwpPIi7iLJ2JE6cb9NP4KFyVo0rpfMozHOog5i8H/c
         j7TWlyM6gJZYE5tf5UuWj+CWyseKO9JsDfbAbwKIVQenLew5M74iwjACamnXhAvDWXhQ
         iH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:user-agent:references:in-reply-to:subject:to:from
         :dkim-signature;
        bh=UIJxEAlQj/HbemPN4KZdxgk+VH926zNpI+GeMP35nDc=;
        b=nr8A+3CHnebMjRmFE1Awoh7GZhkdcdA2uGKXEF2G6d30D6TwTSIrtO8/i+p/mRqZc6
         8IvW9A43jqFUl19tb0+8R8RaRyIejVn3PDn+WKajctdObrw2YGBzQjlr1j3N0m0JcNdz
         HxDG6ob7wZaxapprUBQE7wxjZWp78Bw0o2AMw500j/agyTIBdpjogdftIZc/TxkZaam3
         sE+7ZfRtTMUZSL44soTjIOXZOILr31PhUEC0UUgu1gYiENiSseHpIb1Z2Zk0ba8+KhCz
         z2ZpPyxG1YvVqzQny8knd79+UAnJTyT0DCy/LqeuHPG91Am79HkCrM1S67SYvKBKil4L
         qHfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMHLc66+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y28si4687418iot.95.2021.03.25.08.43.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 08:43:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XMHLc66+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPS8d-0008JL-Bm
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 11:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPS3Z-00015x-Nt
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:37:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lPS3M-0007SI-2y
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616686661;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=UIJxEAlQj/HbemPN4KZdxgk+VH926zNpI+GeMP35nDc=;
 b=XMHLc66+7N8/bXnbJYt3wGEg2UULDN9/DEMdmjoA/UgiHPltALk9xVlq2sKuyPLtReIUPh
 6BBatp6wYiAEDEl+qn+6D76y2PsGluYwcewMHJK+MEBp2uiDysK4fvj58mFK/qiCmopxvw
 nrHOXYYDYEOP96rHp/zEomtgou3VJ+c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-afRaN347NI2hS1tk5KlPqA-1; Thu, 25 Mar 2021 11:37:38 -0400
X-MC-Unique: afRaN347NI2hS1tk5KlPqA-1
Received: by mail-wr1-f69.google.com with SMTP id r12so2815122wro.15
 for <qemu-arm@nongnu.org>; Thu, 25 Mar 2021 08:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=UIJxEAlQj/HbemPN4KZdxgk+VH926zNpI+GeMP35nDc=;
 b=d57XnBRAjMP4BoR/Q9iCJIP+F8eSWzBR9A+dss28UnLzeruJxc1QKsm9z2/swUlXNh
 ooQjwRfd2PSbCREXussYDWzc9+KIs0RAWMGtmVztTk8diTi0clQWfE0qrhQC4Oo5evMM
 l5jCOijnVku8fFfaa/JisyuVsHjSMchTSsPOgPPxM+1hTyDCtd+gxRx+dTLeZgExhvww
 ZKhCQviqSF6jBJyltD6V1WocoK2uCuZjpFiDEBKkf2BJJf8h+ivwy494j09RE0Guvwbd
 ezl0TCm5XVaCwsNDKvIXR0E6gkwY/6XdMJ5xwG8p8fExPy4el8yGyyBuNvx7EXnvx0d1
 6wpA==
X-Gm-Message-State: AOAM531heP/ibWp5LR28rLgER5zOUqkdE9rHGw+c+Q8SE80asZElHgij
 nXM26426vV1VaQISf6/5Xa1H34KkRNdQzsQz8Aibj727b3/7/vig4dYXyiCXJkf9FYfXASKhbRw
 IMRXPUxNUicVi
X-Received: by 2002:adf:f852:: with SMTP id d18mr9970693wrq.210.1616686657012; 
 Thu, 25 Mar 2021 08:37:37 -0700 (PDT)
X-Received: by 2002:adf:f852:: with SMTP id d18mr9970665wrq.210.1616686656712; 
 Thu, 25 Mar 2021 08:37:36 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id u20sm8445764wru.6.2021.03.25.08.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:37:36 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Haibo Xu <haibo.xu@linaro.org>
Subject: Re: [RFC PATCH v2 4/5] Add migration support for KVM guest with MTE
In-Reply-To: <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
 (Haibo Xu's message of "Wed, 17 Mar 2021 09:28:23 +0000")
References: <cover.1615972140.git.haibo.xu@linaro.org>
 <881871e8394fa18a656dfb105d42e6099335c721.1615972140.git.haibo.xu@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Thu, 25 Mar 2021 16:37:35 +0100
Message-ID: <87y2ebmegw.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 dgilbert@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 659wgAv8gCuF

Haibo Xu <haibo.xu@linaro.org> wrote:
> To make it easier to keep the page tags sync with
> the page data, tags for one page are appended to
> the data during ram save iteration.
>
> This patch only add the pre-copy migration support.
> Post-copy and compress as well as zero page saving
> are not supported yet.
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>


>  #define RAM_SAVE_FLAG_XBZRLE   0x40
>  /* 0x80 is reserved in migration.h start with 0x100 next */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
> +#define RAM_SAVE_FLAG_MTE              0x200

Flags are really a scarce resource.  You are using one here, when you
know that you will always have the feature enable (or not), so you can
do better during negotiation IMHO.



> +void precopy_enable_metadata_migration(void)
> +{
> +    if (!ram_state) {
> +        return;
> +    }
> +
> +    ram_state->metadata_enabled = true;
> +}

My understanding is that in your following patch, if mte is enabled, you
will always sent mte tags, for all pages needed, right?

> +static int save_normal_page_mte_tags(QEMUFile *f, uint8_t *addr)
> +{
> +    uint8_t *tag_buf = NULL;
> +    uint64_t ipa;
> +    int size = TARGET_PAGE_SIZE / MTE_GRANULE_SIZE;
> +
> +    if (kvm_physical_memory_addr_from_host(kvm_state, addr, &ipa)) {
> +        /* Buffer for the page tags(one byte per tag) */
> +        tag_buf = g_try_malloc0(size);

size of the buffer is known at start of migration.  Just get a buffer
and reuse it?

Do zero pages have mte tags?  From migration point of view, a zero page
is a page that is just full of zeros, i.e. nothing else special.
Because you are not sending any for them.



> @@ -1148,6 +1219,10 @@ static bool control_save_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>  static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>                              uint8_t *buf, bool async)
>  {
> +    if (rs->metadata_enabled) {
> +        offset |= RAM_SAVE_FLAG_MTE;

You don't really need the flag, for you normal pages are just
TARGET_PAGE_SIZE + (TARGET_PAGE_SIZE/MTE_)


> +    }
> +
>      ram_counters.transferred += save_page_header(rs, rs->f, block,
>                                                   offset | RAM_SAVE_FLAG_PAGE);
>      if (async) {
> @@ -1159,6 +1234,11 @@ static int save_normal_page(RAMState *rs, RAMBlock *block, ram_addr_t offset,
>      }
>      ram_counters.transferred += TARGET_PAGE_SIZE;
>      ram_counters.normal++;
> +
> +    if (rs->metadata_enabled) {

See?  You are not checking the flag, you are checking the bool setup at
the beggining of migration.

> +        ram_counters.transferred += save_normal_page_mte_tags(rs->f, buf);
> +    }
> +
>      return 1;
>  }
>  
> @@ -2189,6 +2269,7 @@ static void ram_state_reset(RAMState *rs)
>      rs->last_version = ram_list.version;
>      rs->ram_bulk_stage = true;
>      rs->fpo_enabled = false;
> +    rs->metadata_enabled = false;
>  }
>  
>  #define MAX_WAIT 50 /* ms, half buffered_file limit */
> @@ -3779,7 +3860,7 @@ static int ram_load_precopy(QEMUFile *f)
>              trace_ram_load_loop(block->idstr, (uint64_t)addr, flags, host);
>          }
>  
> -        switch (flags & ~RAM_SAVE_FLAG_CONTINUE) {
> +        switch (flags & ~(RAM_SAVE_FLAG_CONTINUE | RAM_SAVE_FLAG_MTE)) {

Creating the flag is hurting you here also.

>          case RAM_SAVE_FLAG_MEM_SIZE:
>              /* Synchronize RAM block list */
>              total_ram_bytes = addr;
> @@ -3849,6 +3930,9 @@ static int ram_load_precopy(QEMUFile *f)
>  
>          case RAM_SAVE_FLAG_PAGE:
>              qemu_get_buffer(f, host, TARGET_PAGE_SIZE);
> +            if (flags & RAM_SAVE_FLAG_MTE) {
> +                load_normal_page_mte_tags(f, host);
> +            }

I don't claim to understand the MTE, but my understanding is that if we
are using MTE, all pages have to have MTE flags, right?

So, somtehing like

is_mte_enabled()

that I told in the other thread looks like a good idea.

Later, Juan.

>              break;
>  
>          case RAM_SAVE_FLAG_COMPRESS_PAGE:

