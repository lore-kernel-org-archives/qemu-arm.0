Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4734545wrt;
        Sun, 25 Nov 2018 13:27:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wd0Y2Y3Jwpxypoe4ihqJkF3MIqFPbMHheUE3Q9w3dmR0ePsG0S7AdRB9KxkYAhrQDhhpT2
X-Received: by 2002:a25:c484:: with SMTP id u126-v6mr23939220ybf.201.1543181245396;
        Sun, 25 Nov 2018 13:27:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543181245; cv=none;
        d=google.com; s=arc-20160816;
        b=su1BhXdrcMUiEaoxhLg70HD0TWtvDPwspls3JZ1jPshmEocxhv1GYShjVBe6BHPlQ+
         sjAeULrVjKroexfZc7z2L4/tjC0z80L+ZyPcAMJtWKe12LslMg0Iz9IcSwhVDQe9XHOc
         u8TTJgORbBdUsyr7YDG3EWHuih0HDgilWdrpJJ6jocnXcfiH0HUSTpKKAw5BMytihjjI
         fw4ttae9Ij7kCyUgA65qxZkkp8sN/xxznwx/MgoqNp5m8SlGXFA0OMStLB4ApsdAWJIV
         7xXAWXI2UMXe15RHqcl+2XhHCdR10G9tB8nSZWJM/6FkZU6UZ5cuLwSC+YXgkuG1tRCw
         9ItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=gdDrGRb1PbHcYJ4HnswOtP261zieHUe4svm1pm2L0Ms=;
        b=jLbomTvT26XK9UyCsJ/1D6W0niPsHfy5yWDO9ftxXkFAyqsmPtsLNeWGSZAdfkIyDw
         Kw5Ps3y/lxwzRPWPursRDCZxQY7clBfe13vEvMB6pbbF71XoN4pZSEw8tBBvWND68+/c
         WHoxFQt/fxh9keIVRA7TkRia6cxsbEEM+bQ1hBlq9tLWMXi2Kf/va/J0HA5ZOsCZG/RV
         tKixiG5pLCUy1eY0LF4QYbbjbKuWnjsJbHZ2WfZJ/RCHdVGosx8rd6VM+XkhWXV00SIp
         ShuyVZkV5+Z4Y8GnV5f1DH077brLg4w21JPzZ/sYD+u9Gc1fZkWN62aW2Gy7+bUIHQbA
         N72A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l124-v6si9801169ybl.331.2018.11.25.13.27.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 13:27:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1w4-00072Z-P1
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 16:27:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1vr-00071r-Iu
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 16:27:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1vo-0005Fq-Af
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 16:27:11 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55513)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gR1vo-0005FD-5S
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 16:27:08 -0500
Received: by mail-wm1-f65.google.com with SMTP id y139so16213891wmc.5
	for <qemu-arm@nongnu.org>; Sun, 25 Nov 2018 13:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gdDrGRb1PbHcYJ4HnswOtP261zieHUe4svm1pm2L0Ms=;
	b=Ve9Wa+OgL2h575N+fPU21lAU5skHSGdofYXrr2SZEPOYBSwpv7+1gf04d0aqiqhHrF
	AG2nV4Wwmgu81nYQN7l2AjwHGuoGy5E6TIujk6K4yy8nJQ8kg5K5Zk62j+h8ZN5kHDR1
	Ogw+zp1lm8l4LUawtRxFf5TvtV5wOYcl5oUX6t0dgHI1oimXZy3cty+YT0DJ120CZeY8
	XJqscQU3cMlMLBELQAVhh4JOidtdTvyCRikZ8hEfwpMmyK5RvSnyF2SFiu+Rjp8YDsdo
	NdND+9IgR5Xc3fq4O0tmAuN38jRCAsMrCnfFraMjgqos4g0H1A2rbROh8NLHBmrgAsHQ
	+hfQ==
X-Gm-Message-State: AGRZ1gLvWtzsqU3cNCp+xH9KUgMCI659cbS9jPyOACfk0ZyG91IR+piN
	kFuoM4OME1UDXnP8QfcZM5Z51AeuNAU=
X-Received: by 2002:a1c:3e84:: with SMTP id
	l126-v6mr20346056wma.91.1543181226886; 
	Sun, 25 Nov 2018 13:27:06 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	k15sm40013599wru.8.2018.11.25.13.27.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 13:27:06 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
Date: Sun, 25 Nov 2018 22:27:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181123181059.GN18284@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qb9P4Fecq0ny

Hi Eduardo,

On 23/11/18 19:10, Eduardo Habkost wrote:
> Hi,
> 
> Sorry for not reviewing this series earlier.  I just stumbled
> upon this part of the code:
> 
> On Fri, Nov 23, 2018 at 10:17:14AM +0100, Luc Michel wrote:
>> This commit adds the cpu-cluster type. It aims at gathering CPUs from
>> the same cluster in a machine.
>>
>> For now it only has a `cluster-id` property.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> [...]
>> +static void cpu_cluster_init(Object *obj)
>> +{
>> +    static uint32_t cluster_id_auto_increment;
>> +    CPUClusterState *cluster = CPU_CLUSTER(obj);
>> +
>> +    cluster->cluster_id = cluster_id_auto_increment++;
> 
> I see that you implemented this after a suggestion from Philippe,
> but I'm worried about this kind of side-effect on object/device
> code.  I'm afraid this will bite us back in the future.  We were
> bitten by problems caused by automatic cpu_index assignment on
> CPU instance_init, and we took a while to fix that.

Oops, thanks for catching this. I'm not aware of the cpu_index past issue.

> 
> If you really want to do this and assign cluster_id
> automatically, please do it on realize, where it won't have
> unexpected side-effects after a simple `qom-list-properties` QMP
> command.

This looks clean enough to me.
Do you prefer we don't use static auto_increment at all?

> 
> I would also add a huge warning above the cluster_id field
> declaration, mentioning that the field is not supposed to be used
> for anything except debugging.  I think there's a large risk of
> people trying to reuse the field incorrectly, just like cpu_index
> was reused for multiple (conflicting) purposes in the past.
> 
> 
>> +}
>> +
>> +static Property cpu_cluster_properties[] = {
>> +    DEFINE_PROP_UINT32("cluster-id", CPUClusterState, cluster_id, 0),
>> +    DEFINE_PROP_END_OF_LIST()
>> +};
> [...]
> 
