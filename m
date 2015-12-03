Received: by 10.182.158.201 with SMTP id ww9csp36987obb;
        Thu, 3 Dec 2015 07:49:15 -0800 (PST)
X-Received: by 10.140.173.65 with SMTP id t62mr12640405qht.96.1449157755876;
        Thu, 03 Dec 2015 07:49:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1si9141449qge.5.2015.12.03.07.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Dec 2015 07:49:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:36133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4W8B-0001se-IL
	for alex.bennee@linaro.org; Thu, 03 Dec 2015 10:49:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1a4W89-0001rn-2O
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:49:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1a4W85-0005Gy-RH
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:49:13 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:38627)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1a4W85-0005Gl-GR
	for qemu-arm@nongnu.org; Thu, 03 Dec 2015 10:49:09 -0500
Received: by wmec201 with SMTP id c201so27960870wme.1
	for <qemu-arm@nongnu.org>; Thu, 03 Dec 2015 07:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=HNpenI4WiSD8JMt7PgskJEhdDnMuk76QaUSdrt/1wYQ=;
	b=k9p/JaJKp4VSzH3lmMpp2X67e/DC6ujJyWNGV+dogjgJyas7CRCXBVneE3CTaByFf2
	rsQLizgtKrZvHtjXLKG51aXxLqBGER1S8Mwh5NB8MieEK0W1q7yMKRKN9zy8DtAAsVvg
	ZLA1octyoId7WSvu1RhPPU0vRTOz8Wmfmz48Ytw98q6pMjFYBJI07o0W12696h4qX7QV
	GfL9TJnsnrmX5J9nwaNEIFSAwji1GZbHy7ImGXegEL76rXse7JQ9Zuql5M4jVEfWiPaO
	Qc1w3pEsana/chPXROY8Xwm0wXEWyN5zV+GGbfgxWdINPG9u5twy5WLUTBQ6tFwwJEM5
	ojSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=HNpenI4WiSD8JMt7PgskJEhdDnMuk76QaUSdrt/1wYQ=;
	b=JiuWEMg11Cq6HBy9k3D0ylbfHxqsn/IDthHNteK5gG0aJznr7UVqb9AJH9XQ3OZfsm
	AfYCkii7KO+DH5I7sVg6By69RGGEgknKbkRdXQpGgaPT1CCwjiIsFqFol9nD3ojnHZOw
	U8kfhFXIFKcDnpzKUnL1S6SwHMmtQ0BUdUKuBZ8ObMDN40IhgQr4UZ4KtN9Pea6Vli4+
	fkKJdHH9ZL0ENJQUtWBwWx+h1B6J8qWzGHLmer22j/45Vpkse69Fj3h1EqKECPt6BBmM
	Tqn2+Uk0cgnTKS07A8fiGXnfjMUQ7goA4W9o9qM+wLObvDrjTrmvIMyYuBWDckTYpUSL
	xlTQ==
X-Gm-Message-State: ALoCoQl/iUTYsclWlE9vGTxiXI67HxSd0XaEBAkdharXtxHMF/6y7KxXfTN3QO+1cDtxqIHugGOL
X-Received: by 10.28.140.211 with SMTP id o202mr12777518wmd.8.1449157748844;
	Thu, 03 Dec 2015 07:49:08 -0800 (PST)
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90]) by smtp.googlemail.com with ESMTPSA id
	hw1sm8168385wjb.6.2015.12.03.07.49.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Dec 2015 07:49:07 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
	<1447946528-1533-5-git-send-email-eric.auger@linaro.org>
	<CAPokK=phO1o4cu17QU2Kt2j_mRKk6qWsCgOB0dP=7s8S_3wx7g@mail.gmail.com>
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56606457.1000906@linaro.org>
Date: Thu, 3 Dec 2015 16:48:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=phO1o4cu17QU2Kt2j_mRKk6qWsCgOB0dP=7s8S_3wx7g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: Peter Maydell <peter.maydell@linaro.org>, eric.auger@st.com,
	thomas.lendacky@amd.com, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, suravee.suthikulpanit@amd.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	b.reynal@virtualopensystems.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [RESEND RFC 4/6] device_tree: introduce
 qemu_fdt_getprop_optional
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gK4WHBVAkhSs

Hi Peter,
On 11/27/2015 08:38 PM, Peter Crosthwaite wrote:
> On Thu, Nov 19, 2015 at 7:22 AM, Eric Auger <eric.auger@linaro.org> wrote:
>> Current qemu_fdt_getprop exits if the property is not found. It is
>> sometimes needed to read an optional property, in which case we do
>> not wish to exit but simply returns a null value.
>>
>> This is what this new qemu_fdt_getprop_optional function does.
>>
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>> ---
>>  device_tree.c                | 17 +++++++++++++++++
>>  include/sysemu/device_tree.h |  2 ++
>>  2 files changed, 19 insertions(+)
>>
>> diff --git a/device_tree.c b/device_tree.c
>> index f184e3c..a318683 100644
>> --- a/device_tree.c
>> +++ b/device_tree.c
>> @@ -280,6 +280,23 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>>      return r;
>>  }
>>
>> +const void *qemu_fdt_getprop_optional(void *fdt, const char *node_path,
>> +                             const char *property, bool optional, int *lenp)
>> +{
>> +    int len;
>> +    const void *r;
>> +    if (!lenp) {
>> +        lenp = &len;
>> +    }
>> +    r = fdt_getprop(fdt, findnode_nofail(fdt, node_path), property, lenp);
>> +    if (!r && !optional) {
>> +        error_report("%s: Couldn't get %s/%s: %s", __func__,
>> +                     node_path, property, fdt_strerror(*lenp));
>> +        exit(1);
>> +    }
>> +    return r;
>> +}
>> +
> 
> The real problem here is that the device-tree API is self-asserting.
> This looks the old _nofail system that we removed but just named in
> reverse. The correct solution here is to use the Error API properly.
> Convert qemu_fdt_getprop to accept an Error **, and all existing users
> are converted to pass &error_fatal. This will preserve existing
> behaviour. Then to use the API with your optional semantic your pass
> NULL for the Error **.
OK I will implement your proposal. Thanks for your time.

Best Regards

Eric
> 
> Regards,
> Peter
> 
>>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>>                                 const char *property)
>>  {
>> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
>> index f9e6e6e..10cbe8e 100644
>> --- a/include/sysemu/device_tree.h
>> +++ b/include/sysemu/device_tree.h
>> @@ -34,6 +34,8 @@ int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>>                               const char *target_node_path);
>>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>>                               const char *property, int *lenp);
>> +const void *qemu_fdt_getprop_optional(void *fdt, const char *node_path,
>> +                             const char *property, bool optional, int *lenp);
>>  uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
>>                                 const char *property);
>>  uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
>> --
>> 1.8.3.2
>>
>>

