Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2440002lfg;
        Sat, 20 Mar 2021 16:37:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkQ4IqMrjjmXPs0RarnwsIeDox9Uj2+CsKM4dXtwBgs8xRf6SdxH9hBDpEShcJl4cnq772
X-Received: by 2002:a25:f805:: with SMTP id u5mr15770595ybd.2.1616283435495;
        Sat, 20 Mar 2021 16:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616283435; cv=none;
        d=google.com; s=arc-20160816;
        b=hnjIv+S1uV5Ctv0PSylf2epBY3rSQLJyMFhfKACtgZgN+0MFxNA+OAGl2JaLoy3rDm
         he+7Qt2NbFGa23M4v+X6ySBOT5B0VBlHwciD3T4Tj/tKAidal/S8qAKuQSghZDY4T6Na
         bUhkqr0s7vTbCw6sPRSv8lpSdtR6F2XZhWRIZ1sfc6mEwuexk5NyvPAkMp87ugANJqvs
         lkwa/+OYFCnwME76QnSlAlrohX6L/VJFuIi7UTrAhutjxr+nybdYU4GaSyFcguxSrz+u
         1P27w1kdoukbsK0HklPp9n6u9zIqcBNodQ72wKK0sTYBY7t5qUj1Aamq1+4m5Bki4A+d
         AdgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=yve6PgsFt8dWYRD336czqiHpbck1RcdGJ3xR4NW5SIM=;
        b=wAhL5a2K5wXmNCNIiCJbTnDqV+JJ8qT3MtSYHx86G+2yemHVaQU/tkKyrSvOD1bZFo
         p+9xezgJJteCFicz3xhVrLZkiV4oyFi1ykqWWNBNuIMJC4o3jbeT1VEVurvpS/DDcV1V
         qvIDb6LhJzHGvO7Bqg9IZYYbLAkWxMyVIoDxnDPoBC0Ed1lVfeiTY9g11e6zryKtQjP4
         BXo8hs8VkPl6XwTX8aVKy2PlZK/ZScs5tgGkfY1ZtDYQaoUW83csxN3h1VfHSUzG5xlz
         V+VNeODfxLhqb8ZuzX84cxfJn/T/hqbzft6Vvz5O+mYET6ePozrhcDxTfFEacNVGOoru
         Alqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AJrPg+6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si4799359ybk.487.2021.03.20.16.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Mar 2021 16:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AJrPg+6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNl9e-00089i-S0
	for alex.bennee@linaro.org; Sat, 20 Mar 2021 19:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNl9R-00088x-JE
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 19:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNl9P-0008Ed-4p
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 19:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616283418;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yve6PgsFt8dWYRD336czqiHpbck1RcdGJ3xR4NW5SIM=;
 b=AJrPg+6a4NY6aMGYO3r+GpeAU2uTpwyQEuWCTlWCs0QilNtOVxPn2E0ZudXZFruIBbYfY4
 ZpnNO2VcQMp1lJujhNOgwqevSsopnv1/PN0zaR0Q/IRNhj3xMJXujTcorJqzg0RvJuJHbT
 P6nGO6mWhFr7Yyg/bvZKR590EtZqNto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-psPpqT4nNFahZS06huj-AQ-1; Sat, 20 Mar 2021 19:36:54 -0400
X-MC-Unique: psPpqT4nNFahZS06huj-AQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A74A801817;
 Sat, 20 Mar 2021 23:36:53 +0000 (UTC)
Received: from [10.64.54.40] (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C22360C5A;
 Sat, 20 Mar 2021 23:36:50 +0000 (UTC)
Subject: Re: [PATCH] configure: Improve alias attribute check
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210320042753.69297-1-gshan@redhat.com>
 <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
 <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <0798e22b-4aed-7f72-5e77-4520d9cc010b@redhat.com>
Date: Sun, 21 Mar 2021 10:36:47 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <107a73a0-aafe-bfce-7c28-8ed5fe6c022f@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: thuth@redhat.com, qemu-arm@nongnu.org, philmd@redhat.com, laurent@vivier.eu,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wvWG+fRDzWy8

Hi Paolo and Richard,

On 3/21/21 9:33 AM, Richard Henderson wrote:
> On 3/20/21 11:52 AM, Paolo Bonzini wrote:
>>> +int main(void)
>>> +{
>>> +    return read_y();
>>> +}
>>
>> I think this should be "read_y() == 1 ? 0 : 1".
> 
> As a testcase returning 0 on success, yes.
> 

Ok. I will include the changes in v2. Also, I will
wrap the lines, for example:

int main(void) { return (read_y() == 1) ? 0 : 1; }

if compile_prog "" "" && $TMPE >/dev/null 2>/dev/null; then
    attralias=yes
fi

>> I can reproduce it with -flto -O2 but not without -flto, do you agree?
> 
> Agreed.  Replicated with a random recent gcc 11 snapshot.
> This is really annoying of lto.  It's clear something needs to change though.
> 

The command I used is:

gcc -O2 -flto=auto config-temp.c config-temp-b.c -o config-temp.exe.

Removing "-O2" or "-flto=auto" can make the gcc alias attribute workable again.

>> Perhaps we can obtain the same optimization by wrapping reads of the page size in an inline __attribute__((const)) function.  Richard, what do you think?
> 
> I'll give it a shot and see what happens.
> 

Thanks,
Gavin

