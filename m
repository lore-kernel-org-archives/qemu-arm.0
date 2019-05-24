Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3115132wrg;
        Fri, 24 May 2019 07:40:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziwg6r+ljQS4NTbX4OlAnRi72gLRW+3EQfQ1wgN4lF1Vzkt1yQnomiNw3CMoAjr4U/kgrk
X-Received: by 2002:a1f:910d:: with SMTP id t13mr5285827vkd.87.1558708850019;
        Fri, 24 May 2019 07:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558708850; cv=none;
        d=google.com; s=arc-20160816;
        b=IqLso3lMDGH1+0JC4DrO+HgnNgij1htl4xNKSxo6yd0u3A88Wxfg+zHcetbcO4OoMZ
         +Swdpg/UAznKnzTHcaVI9naYDe48x8BfwWYgbsAiJPkP5ud/s5mC6v/b6UZ8tDTXDi79
         UGGv17GVkNXjGmF1MVn/SiFcwaBXYNhpHOMpoo+eDP34RUFDzH1YniPlcMgm6Y4BGnLE
         KL8ZLJMaSzi6exIiro4ZOap0FZsIgV6Eak4nkaW/8kqu5rTRK1Ln3VA5Snk5MAEnoWaM
         5IyX7CsM9oIXfMAET7T1/fapf8/54BfuWdf/gLiP9RTZuDoSuVN8L4tdlaunydmYuf1y
         eTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=payOgK+WQ7PpvcAToTx/WQGqB0Z/QyxbSa34K15pUeE=;
        b=IfxTqLoFBMr0zU//EaI628blp6PtniHTCu65k/d3j9J9bl3P6doWNCHkxv4otPorvM
         1CeOCVAzNCZRFzSemyWULACEJk4KBPfoEtijAZBwA6y5i2/Gz/LNcUVFci5UJQTWlXoc
         y4gqkP7OeYMeWvDHg2thllX6ZwABWM7Jrzdx6M1iECQbmD7spWdNxEPalEf8Kvicu7Qb
         GNVQPFRwgT7D/ur3oJIl37KSZJGNF24KXffBiO3/M6C8RTrJl/0DPCxdE5VEiFXhwRIf
         B9GxsyF+O/y5TBcv9RlhjdkHy976bWxMr8OTb3Rh4y8ZHKf4vcDoAlVy4BntlxKoeJJm
         1Qcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p22si615433vsm.173.2019.05.24.07.40.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 May 2019 07:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUBNI-0003uO-MQ
	for alex.bennee@linaro.org; Fri, 24 May 2019 10:40:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hUBN2-0003mt-Gv
	for qemu-arm@nongnu.org; Fri, 24 May 2019 10:40:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1hUBLt-0006SW-Av
	for qemu-arm@nongnu.org; Fri, 24 May 2019 10:39:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42984)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1hUBLt-0006R9-3A; Fri, 24 May 2019 10:39:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E02A58110E;
	Fri, 24 May 2019 14:39:19 +0000 (UTC)
Received: from [10.40.205.56] (unknown [10.40.205.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF09269287;
	Fri, 24 May 2019 14:39:15 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190524103521.13847-1-lvivier@redhat.com>
	<20190524161045.314fa2de@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <c1c017f2-84ed-bddf-abb9-7154d9edb372@redhat.com>
Date: Fri, 24 May 2019 16:39:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190524161045.314fa2de@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 24 May 2019 14:39:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] numa: improve cpu hotplug
 error message with a wrong node-id
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IFDQSDj0u+FJ

On 24/05/2019 16:10, Igor Mammedov wrote:
> On Fri, 24 May 2019 12:35:21 +0200
> Laurent Vivier <lvivier@redhat.com> wrote:
> 
>> On pseries, core-ids are strongly binded to a node-id by the command
>> line option. If an user tries to add a CPU to the wrong node, he has
>> an error but it is not really helpful:
>>
>>    qemu-system-ppc64 ... -smp 1,maxcpus=64,cores=1,threads=1,sockets=1 \
>>                          -numa node,nodeid=0 -numa node,nodeid=1 ...
>>
>>    (qemu) device_add power9_v2.0-spapr-cpu-core,core-id=30,node-id=1
>>    Error: node-id=1 must match numa node specified with -numa option
>>
>> This patch improves this error message by giving to the user the good
>> topology information (node-id, socket-id and thread-id if they are
>> available) to use with the core-id he's providing:
>>
>>    Error: node-id=1 must match numa node specified with -numa option 'node-id 0'
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>
>> Notes:
>>      v3: only add the topology to the existing message
>>          As suggested by Igor replace
>>            Error: core-id 30 can only be plugged into node-id 0
>>          by
>>            Error: node-id=1 must match numa node specified with -numa option 'node-id 0'
>>      
>>      v2: display full topology in the error message
>>
>>   numa.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/numa.c b/numa.c
>> index 3875e1efda3a..7882ec294be4 100644
>> --- a/numa.c
>> +++ b/numa.c
>> @@ -458,6 +458,27 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>>       set_numa_options(MACHINE(qdev_get_machine()), cmd, errp);
>>   }
>>   
>> +static char *cpu_topology_to_string(const CPUArchId *cpu)
>> +{
>> +    GString *s = g_string_new(NULL);
>> +    if (cpu->props.has_socket_id) {
>> +        g_string_append_printf(s, "socket-id %"PRId64, cpu->props.socket_id);
>> +    }
>> +    if (cpu->props.has_node_id) {
>> +        if (s->len) {
>> +            g_string_append_printf(s, ", ");
>> +        }
>> +        g_string_append_printf(s, "node-id %"PRId64, cpu->props.node_id);
>> +    }
>> +    if (cpu->props.has_thread_id) {
>> +        if (s->len) {
>> +            g_string_append_printf(s, ", ");
>> +        }
>> +        g_string_append_printf(s, "thread-id %"PRId64, cpu->props.thread_id);
>> +    }
>> +    return g_string_free(s, false);
>> +}
> 
> turns out we already have such helper: cpu_slot_to_string()

It doesn't display the node-id but the core-id. And node-id is what we 
need to know.

Thanks,
Laurent
