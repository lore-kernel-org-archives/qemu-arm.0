Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp888057lfp;
        Tue, 14 Sep 2021 10:21:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwf+g89mUyqsgdwh+DQLeWLdZaZLMuWwR/oWyFgWucyhD+n1QC1TD/Vb5MDX+mn7306zJky
X-Received: by 2002:a05:6402:2da:: with SMTP id b26mr20085395edx.160.1631640077948;
        Tue, 14 Sep 2021 10:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631640077; cv=none;
        d=google.com; s=arc-20160816;
        b=l7m61xPjjnwOcV9zr1xXqHrp720hDpg6GeP6LrNtcnCLkfLAn7PCp6zG4e3iNqVoDm
         y2sQJ1xwYPXom8mxbFnvY5+l2xwFiKe2OlQWO1yWCk80l5RHES4AnqcAmxqjy15gGAd6
         doQiOSe7UaYyrb5cqcj9FORx03OSr5X5eR8l+2f5aD0WustmejxPCRH9lMBJTQHe76uC
         ehoXb1Yf6yaibKdZxAl4xoNeG89Z7BYTumutoH3aK4zz7Bmo1kaXX75FSxvkael/ctYJ
         tVIxNoCYAzMOpLxYJyQ/qrXmGDx3ou6+7OPC7tQrHKNSffAZ5vxDM4tN6TzRXYzmraYA
         hR+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jJ9xWZMiWsz/BwXwvXZIrZr6DPdm4UKto1ksF+WrM54=;
        b=O/h56H3+1CfEiX0A9vXqs1WD0NKbF55r3iD1poSns2Xq5UOnKaHt6AWCIgEO3EPWzS
         V78jBYYpeQmLY82e4AhJNTDEqoeU9QiO+cC96XFVGrbtkWdE1LF9/GSRgd4VaiidhXua
         54wrKDqdNoDOg03JN6kbAAMj/jYMnHbqWgrjpSvBFiolwj7zlwTxI3XENFP7qPStSi5i
         NDW55MSfhEs7a7YCVBiBb0hM4nQPuPDES7/19FBRCpwhzScFISpz/JdLHRPI6TsaaWB6
         uYWE1Cl3f3uLOabFgtFG7hJAJVy8wfqDcQ+2nwLyszKZ07oGkFq4utm/A0bUVGrw7cLQ
         ZD5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YRjkoSY3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si2654744edr.514.2021.09.14.10.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 10:21:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YRjkoSY3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQC7R-0008Ly-0t
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 13:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQC1x-000893-NX
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQC1u-0000Ud-Ki
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631639734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJ9xWZMiWsz/BwXwvXZIrZr6DPdm4UKto1ksF+WrM54=;
 b=YRjkoSY3LNboPQwwcuvPPmgESPQGT3RgdHjZ8iL7/ZC8qYg24VtMTGhfAQFM/j5iFQkDxb
 D8XULY5SmVKgMcTjiAj4RquXmPBpIpW+tWlkyn6SytYTu3BHoo4iSThQ5jHwzmgjQPzKPC
 B+Nx6rrYBN/e5joYy3C3QDqWhKweNKo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-sj3ywjIXOR-DDlffkDm-ag-1; Tue, 14 Sep 2021 13:15:32 -0400
X-MC-Unique: sj3ywjIXOR-DDlffkDm-ag-1
Received: by mail-wr1-f69.google.com with SMTP id
 i16-20020adfded0000000b001572ebd528eso4209356wrn.19
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jJ9xWZMiWsz/BwXwvXZIrZr6DPdm4UKto1ksF+WrM54=;
 b=2MR8+OnGYH+VcFyP4w7FImW6jrYEsv6moJm8DmwnQqNZLTjBuSwQwHwmWqyRvrW6Og
 we3+EzzCOs3PVDKz+lJl3e2mFNsKL6gwhrCwZSUoGsM3aVxurQnPqdW8AOuA6rgE646S
 dufadfeG/+WaWqhjKgbXwiN14F/RBUtk5CRS8/BVYu82saxhh1tHPb/jcCHe8j1bTvL/
 GGqn8RumBzXRvBVm5jnekDqPX4jZ/t1pIffpeetGDthypyjgZnxAwi+hpU8Wj349O1fq
 lmm45pX+hU6mhTDFQJAAgsnlMo2OAny3PzzeQQX2DXfXjNSJKA5PqLOqXUNBVRs7/pwE
 8BdA==
X-Gm-Message-State: AOAM531YkR3Y0chw4o+qMDJnYXk8M8SF6lxLeABySuRG2aXqjUEnNmF4
 0Xqm90IVojG6L5S7ZXsQedTVTzafXazcJ6YgIGIH7TQ7KCZq9z8xtag1Qo/l7aUaO3VHTp8oL4W
 13omY5769QKe3UCc=
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr291531wrr.236.1631639731650; 
 Tue, 14 Sep 2021 10:15:31 -0700 (PDT)
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr291478wrr.236.1631639731319; 
 Tue, 14 Sep 2021 10:15:31 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id j27sm1554808wms.6.2021.09.14.10.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:15:30 -0700 (PDT)
Subject: Re: [PATCH v2 29/53] qapi: introduce x-query-registers QMP command
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-30-berrange@redhat.com>
 <20210914160416.tmk5nuhch2yhfb27@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <da6637f1-413c-73a3-686d-0e8913c46da9@redhat.com>
Date: Tue, 14 Sep 2021 19:15:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914160416.tmk5nuhch2yhfb27@redhat.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ug/FvQJPq7uv

On 9/14/21 6:04 PM, Eric Blake wrote:
> On Tue, Sep 14, 2021 at 03:20:18PM +0100, Daniel P. Berrangé wrote:
>> This is a counterpart to the HMP "info registers" command. It is being
>> added with an "x-" prefix because this QMP command is intended as an
>> ad hoc debugging tool and will thus not be modelled in QAPI as fully
>> structured data, nor will it have long term guaranteed stability.
>> The existing HMP command is rewritten to call the QMP command.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---

>> +##
>> +# @HumanReadableText:
>> +#
>> +# @human-readable-text: Formatted output intended for humans.
>> +#
>> +# Since: 6.2.0
> 
> Should be '6.2', not '6.2.0', to match...
> 
>> +#
>> +##
>> +{ 'struct': 'HumanReadableText',
>> +  'data': { 'human-readable-text': 'str' } }
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 157712f006..8737efa865 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1312,3 +1312,18 @@
>>       '*cores': 'int',
>>       '*threads': 'int',
>>       '*maxcpus': 'int' } }
>> +
>> +##
>> +# @x-query-registers:
>> +#
>> +# @cpu: the CPU number to query. If omitted, queries all CPUs
>> +#
>> +# Query information on the CPU registers
>> +#
>> +# Returns: CPU state in an architecture-specific format
>> +#
>> +# Since: 6.2
> 
> ...the prevailing style.
> 
> If it were likely that someone might backport just some (but not all)
> added x- commands, it may be wise to separate the creation of
> HumanReadableText into its own patch to backport that but not
> x-query-registers.  But I rather suspect anyone backporting this will
> take the series wholesale, so the coupling in this patch is not worth
> worrying about.

IIUC the problem is this breaks bisection, as you get a QAPI error:

 qapi/qapi-commands-machine.c:123:13: error:
‘qmp_marshal_output_HumanReadableText’
defined but not used [-Werror=unused-function]
  123 | static void
qmp_marshal_output_HumanReadableText(HumanReadableText *ret_in,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

See the comment added in commit 1f7b9f3181e
("qapi/commands: add #if conditions to commands").

> 
>> +##
>> +{ 'command': 'x-query-registers',
>> +  'data': {'*cpu': 'int' },
>> +  'returns': 'HumanReadableText' }
>> -- 
>> 2.31.1
>>
> 

