Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4727077ejc;
        Mon, 27 Feb 2023 07:17:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9G1jLubDQO/vkpVr3c/IOMCU5CNMG+J6izHBswqi452bin6/YRo0g520aFJk1rKmPqvTHZ
X-Received: by 2002:a17:906:ce3c:b0:8b1:7ab0:a462 with SMTP id sd28-20020a170906ce3c00b008b17ab0a462mr36914508ejb.7.1677511058995;
        Mon, 27 Feb 2023 07:17:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677511058; cv=none;
        d=google.com; s=arc-20160816;
        b=aR9HcQ9TZHuE1zxGaVcl2G7XVecmDxvfkpIG50T6NaV15hFA1UZovJi5m/ktienzfj
         jPiYlSU2+fzY2eDZMwdd61S97PATYchxuwEPufB0FGkmKd4nM7eHlnzG4yBz6xPKGzt2
         zjtAsbBeired+Ms5yaZ0CbzNpK9Qw1RMksbJoFIgVh5OBKdZ2sNODNjZ7Q2dEAFwiXk2
         mXEhuFma7/1kL2o2MeilNyxMB+NUAB5tOyJiAMY4loQ3rpx77pR+Ook2Oxv6PrIe+ng/
         1cc8930wrj2rvoz171EofQzC2h7uI4K2GkiHm7EsL53w0+dUWzLk9Ut3r8xU42pRzpcf
         19qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=e2HlQn8VggXQIctikuntg6nDNttpSf2H60bnmaDjpGM=;
        b=aEl6quLxKXjWMAPyG4Yu1gJ8azgfAoQ9akv/wK15E99xNMOE18By9yWWkqbB75vwT+
         CDFMtxrl2a3v1VJoIP0gsodWoSSgA9u3/QuTO3wyePkThzjtWaxLwTyLp2JjAvmGA1oS
         ERyb2J/C3sFkohMZauX/Y22bEA6CvqiIt502loYm/mqMNLJJF6DJpzcsNhxkG1Tfk5Bn
         oRVlO72eOro1YZKcDkMbeg3pPJh11gUS9JFh3DygT7fysiodjkrajioWZEom7aaPasmw
         /jRlfyL5bRzMRs7VDMm7ygGhSJyu53rslOwz2Q8klU6UMwU1jy1y9afunrY5kNCUTZKG
         Amsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d5jws7UT;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id v20-20020a056402185400b004ab168946cdsi402857edy.345.2023.02.27.07.17.38;
        Mon, 27 Feb 2023 07:17:38 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d5jws7UT;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjB0PRh (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Mon, 27 Feb 2023 10:17:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjB0PRf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 27 Feb 2023 10:17:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB6722A00
        for <kvm@vger.kernel.org>; Mon, 27 Feb 2023 07:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677511006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=e2HlQn8VggXQIctikuntg6nDNttpSf2H60bnmaDjpGM=;
        b=d5jws7UTPjk/jxGxTU/lNA4ZJOXqGMGh7MXWiHpQBzWG8asguRE6LABdYK4+adjt79ZiNi
        YZ5WmY8IR2EAEk1NLbXNnH6Eg0js/BNLcHIw6gPQXwF+XklHUe7EP7hgB7/G7GwbmG2A61
        TdRwCOTeQ31+WAesQ8eQpLrFz4K6LKY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-3zk3FmqAPAC5pxYiCeQoaA-1; Mon, 27 Feb 2023 10:16:45 -0500
X-MC-Unique: 3zk3FmqAPAC5pxYiCeQoaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9071B3C18368;
        Mon, 27 Feb 2023 15:16:43 +0000 (UTC)
Received: from localhost (unknown [10.45.226.217])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 475602166B2B;
        Mon, 27 Feb 2023 15:16:43 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Eric Auger <eauger@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 3/3] qtests/arm: add some mte tests
In-Reply-To: <87h6vt8rf3.fsf@redhat.com>
Organization: Red Hat GmbH
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-4-cohuck@redhat.com>
 <a7904d6e-c8e5-055b-34f7-8ea2956ec65f@redhat.com>
 <87h6vt8rf3.fsf@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date:   Mon, 27 Feb 2023 16:16:42 +0100
Message-ID: <87y1oj3zqd.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: cqhLMv3QffJN

On Fri, Feb 10 2023, Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, Feb 06 2023, Eric Auger <eauger@redhat.com> wrote:
>
>> Hi,
>>
>> On 2/3/23 14:44, Cornelia Huck wrote:
>>> +static void mte_tests_default(QTestState *qts, const char *cpu_type)
>>> +{
>>> +    assert_has_feature(qts, cpu_type, "mte");
>>> +
>>> +    /*
>>> +     * Without tag memory, mte will be off under tcg.
>>> +     * Explicitly enabling it yields an error.
>>> +     */
>>> +    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
>>> +    assert_error(qts, cpu_type, "mte=on requires tag memory",
>>> +                 "{ 'mte': 'on' }");
>> Sorry in v4 I reported I preferred the pauth msg, clarifying now:
>>
>>     assert_error(qts, cpu_type, "cannot enable pauth-impdef without pauth",
>>                  "{ 'pauth': false, 'pauth-impdef': true }");
>>
>> Here would translate into cannot enable mte without tag memory.
>
> Oh, so you mean that I should adapt the message generated by the code?

Friendly ping :) Did you mean to adapt the error messages in cpu64.c?
