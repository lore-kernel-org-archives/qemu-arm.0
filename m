Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3879715wrq;
        Mon, 25 Jun 2018 07:31:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIMLFy4FlLm37doXHMoWzI6y2BcXqkbHRhwrClGO9xTb6RpVIfZBrQZ2D91YbZ4FhRitr7u
X-Received: by 2002:a37:8d81:: with SMTP id p123-v6mr10463067qkd.4.1529937091268;
        Mon, 25 Jun 2018 07:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529937091; cv=none;
        d=google.com; s=arc-20160816;
        b=Xoz2N9JVV3NLZqpGjxyJuGbdmdnaHcv2UMu1QBpNY5f/9RNwumC6QennItvZm/G3Un
         rtU/zWgGe3Fgp05F8Qtam7AOtN/ahZZj8MWTIjjcEzrJzpEE7/fhJAFiuTIIt+5NjlfH
         ehAqLTXI/7m+WN/IE7OCIZDsj1G6RvBoyes8EqKWyWcklu23RpNZ9dMuuqM91UV+82md
         7USC7u1zDnwuFYSh1xt18ZuLgeNmwk5R8w6xrjfakfqYTzdcTFgYqq1NbPxz4JMx6cj+
         tLGqQYDIXPD8khLS5KpdFlqGYOoQTmaol+KyA8pPDE7hgWy148APSkF48I7hScjG0d7H
         SPdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=8PpoIh6hcT41W0XhkT6eBEc9emEsirYG7GtZ4k/4eV8=;
        b=DJ4ofZOihpHBcpgl2l+iski72InsAtpfe0JLZMKOqXCJJTDg/1aJf5yF3TEKzgP04v
         iJgDINkvLlczQRL3Xj+o1buZbjwKQuAXVVuam5rN/gY0cHCcejIhNwAWCI+lNIpDDnIF
         jCXleoCxYwrXcMDUsAC4J+Z6ap3++Nq3FKo1n0+oq52HlKuLyBpmyHX7fdr3EvKK1T1f
         BDyNREXHB8qqILovU+cxf8htPuvcB71t90nhqvaKw5/UO0uAn2eticjKDx/Gbx6utNN1
         jWcpjoSMV14FV3xW22qA7Laue1CgPWtbqOc/xAVpWxOHiRvTvHNJjpeeTolQPjg9teuH
         5Q1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l9-v6si6520401qtj.324.2018.06.25.07.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 07:31:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXSWg-00045m-Iz
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 10:31:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fXSWB-00040O-Sz
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 10:31:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fXSW5-0003Nr-Vy
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 10:30:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42460 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fXSVy-0003KA-3F; Mon, 25 Jun 2018 10:30:46 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A65F84000B8A;
	Mon, 25 Jun 2018 14:30:45 +0000 (UTC)
Received: from [10.36.116.31] (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C7BB2026D5B;
	Mon, 25 Jun 2018 14:30:44 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-8-f4bug@amsat.org>
	<e98bac2c-ce0b-e226-3d96-004e46478f2f@redhat.com>
	<8256c2d4-722c-299f-e8e3-42c1a7f68e1d@amsat.org>
	<0bf443e6-fd49-9aaf-43fb-f171edf5fd38@redhat.com>
	<57e04a05-442c-bd4a-2daa-1b690540c061@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
	xsFNBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
	yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
	4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
	tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
	0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
	O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
	0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
	gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
	3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
	zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABzRxUaG9tYXMgSHV0
	aCA8dGguaHV0aEBnbXguZGU+wsF7BBMBAgAlAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIX
	gAUCUfuWKwIZAQAKCRAu2dd0/nAttbe/EACb9hafyOb2FmhUqeAiBORSsUifFacQ7laVjcgR
	I4um8CSHvxijYftpkM2EdAtmXIKgbNDpQoXcWLXB9lu9mLgTO4DVT00TRR65ikn3FCWcyT74
	ENTOzRKyKLsDCjhXKPblTPIQbYAUCOWElcyAPm0ERd62fA/rKNxgIiNo/l4UODOMoOJm2/Ox
	ZoTckW68Eqv7k9L7m7j+Hn3hoDTjAmcCBJt+j7pOhzWvCbqoNOIH8C8qvPaNlrba+R/K6jkO
	6jZkTbYQpGIofEQJ/TNn38IsNGpI1ALTHWFtoMxp3j2Imz0REO6dRE2fHRN8sVlHgkoeGhmY
	NbDsDE1jFQOEObFnu0euk//7BXU7tGOHckVAZ8T1smiRPHfQU7UEH2a/grndxJ+PNeM5w7n2
	l+FN3cf2KgPotCK2s9MjSdZA7C5e3rFYO8lqiqTJKvc62vqp3e7B0Kjyy5/QtzSOejBij2QL
	xkKSFNtxIz4MtuxN8e3IDQNxsKry3nF7R4MDvouXlMo6wP9KuyNWb+vFJt9GtbgfDMIFVamp
	ZfhEWzWRJH4VgksENA4K/BzjEHCcbTUb1TFsiB1VRnBPJ0SqlvifnfKk6HcpkDk6Pg8Q5FOJ
	gbNHrdgXsm+m/9GF2zUUr+rOlhVbK23TUqKqPfwnD7uxjpakVcJnsVCFqJpZi1F/ga9IN87B
	TQRR+3lMARAAtp831HniPHb9AuKq3wj83ujZK8lH5RLrfVsB4X1wi47bwo56BqhXpR/zxPTR
	eOFT0gnbw9UkphVc7uk/alnXMDEmgvnuxv89PwIQX6k3qLABeV7ykJQG/WT5HQ6+2DdGtVw3
	2vjYAPiWQeETsgWRRQMDR0/hwp8s8tL/UodwYCScH6Vxx9pdy353L1fK4Bb9G73a+9FPjp9l
	x+WwKTsltVqSBuSjyZQ3c3EE8qbTidXZxB38JwARH8yN3TX+t65cbBqLl/zRUUUTapHQpUEd
	yoAsHIml32e4q+3xdLtTdlLi7FgPBItSazcqZPjEcYW73UAuLcmQmfJlQ5PkDiuqcitn+KzH
	/1pqsTU7QFZjbmSMJyXY0TDErOFuMOjf20b6arcpEqse1V3IKrb+nqqA2azboRm3pEANLAJw
	iVTwK3qwGRgK5ut6N/Znv20VEHkFUsRAZoOusrIRfR5HFDxlXguAdEz8M/hxXFYYXqOoaCYy
	6pJxTjy0Y/tIfmS/g9Bnp8qg9wsrsnk0+XRnDVPak++G3Uq9tJPwpJbyO0vcqEI3vAXkAB7X
	VXLzvFwi66RrsPUoDkuzj+aCNumtOePDOCpXQGPpKl+l1aYRMN/+lNSk3+1sVuc2C07WnYyE
	gV/cbEVklPmKrNwu6DeUyD0qI/bVzKMWZAiB1r56hsGeyYcAEQEAAcLBXwQYAQIACQUCUft5
	TAIbDAAKCRAu2dd0/nAttYTwEACLAS/THRqXRKb17PQmKwZHerUvZm2klo+lwQ3wNQBHUJAT
	p2R9ULexyXrJPqjUpy7+voz+FcKiuQBTKyieiIxO46oMxsbXGZ70o3gxjxdYdgimUD6U8PPd
	JH8tfAL4BR5FZNjspcnscN2jgbF4OrpDeOLyBaj6HPmElNPtECHWCaf1xbIFsZxSDGMA6cUh
	0uX3Q8VI7JN1AR2cfiIRY7NrIlWYucJxyKjO3ivWm69nCtsHiJ0wcF8KlVo7F2eLaufo0K8A
	ynL8SHMF3VEyxsXOP2f1UR9T2Ur30MXcTBpjUxml1TX3RWY5uH89Js/jlIugBwuAmacJ7JYh
	lTg6sF/GNc4nPb4kk2yktNWTade+TzsllYlJPaorD2Qe8qX0iFUhFC6y9+O6mP4ZvWoYapp9
	ezYNuebMgEr93ob1+4sFg3812wNP01WqsGtWCJHnPv/JoonFdMzD/bIkXGEJMk6ks2kxQQZq
	g6Ik/s/vxOfao/xCn8nHt7GwvVy41795hzK6tbSl+BuyCRp0vfPRP34OnK7+jR2nvQpJu/pU
	rCELuGwT9hsYkUPjVd4lfylN3mzEc6iAv/wwjsc0DRTSQCpXT3v2ymTAsRKrVaEZLibTXaf+
	WslxWek3xNYRiqwwWAJuL652eAlxUgQ5ZS+fXBRTiQpJ+F26I/2lccScRd9G5w==
Message-ID: <2eab61ba-1220-095d-721b-53357104fb45@redhat.com>
Date: Mon, 25 Jun 2018 16:30:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <57e04a05-442c-bd4a-2daa-1b690540c061@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 25 Jun 2018 14:30:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 25 Jun 2018 14:30:45 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v2 07/14] hw/i2c/omap_i2c: Use
 qemu_log_mask(UNIMP) instead of fprintf
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z5zM4H6zXQwb

On 25.06.2018 14:52, Philippe Mathieu-Daud=C3=A9 wrote:
> On 06/25/2018 03:08 AM, Thomas Huth wrote:
>> On 22.06.2018 22:10, Philippe Mathieu-Daud=C3=A9 wrote:
>>> On 06/22/2018 04:38 PM, Thomas Huth wrote:
>>>> On 22.06.2018 15:40, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>> ---
>>>>>  hw/i2c/omap_i2c.c | 20 ++++++++++++--------
>>>>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
>>>>> index 26e3e5ebf6..690876e43e 100644
>>>>> --- a/hw/i2c/omap_i2c.c
>>>>> +++ b/hw/i2c/omap_i2c.c
>>>>> @@ -17,6 +17,7 @@
>>>>>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>>>>>   */
>>>>>  #include "qemu/osdep.h"
>>>>> +#include "qemu/log.h"
>>>>>  #include "hw/hw.h"
>>>>>  #include "hw/i2c/i2c.h"
>>>>>  #include "hw/arm/omap.h"
>>>>> @@ -339,14 +340,15 @@ static void omap_i2c_write(void *opaque, hwad=
dr addr,
>>>>>              }
>>>>>              break;
>>>>>          }
>>>>> -        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST =
*/
>>>>> -            fprintf(stderr, "%s: I^2C slave mode not supported\n",
>>>>> -                            __func__);
>>>>> +        if ((value & (1 << 15)) && !(value & (1 << 10))) { /* MST =
*/
>>>>
>>>> Please keep the white spaces before the comment if you don't change
>>>> anything else.
>>>
>>> This is a <tab> and checkpatch complains...
>>>
>>> I can use 4 spaces for this tab. I tried to align with other tab-alig=
ned
>>> comments I didn't modify, but the result is messier. Thus a simple sp=
ace.
>>
>> Oh, sorry, I didn't notice that you've replaced a TAB here. I guess it=
's
>> ok then. But why does checkpatch complain if it is just in the context
>> of your modification? That's weird.
>=20
> The first 2 contexts (MST and XA) are fine, however checkpatch complain=
s
> with the last one (ST_EN):
>=20
> ERROR: code indent should never use tabs
> #38: FILE: hw/i2c/omap_i2c.c:397:
> +        if (value & (1 << 15)) {^I^I^I^I^I/* ST_EN */$
>=20
> Since I replaced this one, I also did with the 2 previous.
>=20
> Now I realize I can _not_ add the brackets so I don't have to update th=
e
> <tabs>:
>=20
>          if (value & (1 << 15))^I^I^I^I^I/* ST_EN */
> -            fprintf(stderr, "%s: System Test not supported\n", __func_=
_);
> +            qemu_log_mask(LOG_UNIMP,
> +                          "%s: System Test not supported\n", __func__)=
;
>          break;
>=20
> I think if it better to unify the code style when possible, but it is u=
p
> to you, if you prefer I can resend with tabs and no brackets.

I think it's OK to fix up the coding style here, too. Maybe just mention
it in the patch description ("While we're at it, change TABs to spaces
and add missing curly braces to the surounding if-statements" or so).

 Thomas
